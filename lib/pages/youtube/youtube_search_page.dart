import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter30daychallange/pages/youtube/model/youtube_serch_model.dart';
import 'package:flutter30daychallange/pages/youtube/paly_video.dart';

import 'model/items_data.dart';

class YoutubeSearchPage extends StatefulWidget {
  const YoutubeSearchPage({super.key});

  @override
  State<YoutubeSearchPage> createState() => _YoutubeSearchPageState();
}

class _YoutubeSearchPageState extends State<YoutubeSearchPage> {
  bool _isSearch = false;
  bool _isLoading = true;
  int navIndex = 0;
  List<ItemData> items=[];

  @override
  void initState() {
    super.initState();
    _loadMockDataFromAssets();
  }
//loading data 
  Future<void> _loadMockDataFromAssets() async {
    Future.delayed(Duration(seconds: 3),(){
      setState(() {
        _isLoading=false;
      });
    });
    final assetsData = await rootBundle.loadString("assets/youtube_serch.json");

    final response = YoutubeSearchModel.fromJson(json.decode(assetsData));
    items = response.items;
    print(response.items[1].snippet.thumbnails.high!.url);
  }

  Widget _SearchWidget() {
    return Row(
      children: [
        InkWell(
            onTap: () {
              setState(() {
                _isSearch = false;
              });
            },
            child: Icon(Icons.arrow_back)),
        SizedBox(
          width: 5,
        ),
        Expanded(
          child: Container(
              height: 45,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.2),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    hintText: "Search youtube", border: InputBorder.none),
              )),
        ),
        SizedBox(
          width: 5,
        ),
        Container(
            height: 38,
            width: 38,
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(.1), shape: BoxShape.circle),
            child: Icon(Icons.mic))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isSearch == true
            ? _SearchWidget()
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: 25, child: Image.asset("assets/youtubelogo.png")),
                  Row(
                    children: [
                      SizedBox(
                        width: 8,
                      ),
                      Icon(Icons.notifications_none_outlined),
                      SizedBox(
                        width: 8,
                      ),
                      InkWell(
                          onTap: () {
                            if (_isSearch == false) {
                              setState(() {
                                _isSearch = true;
                              });
                            }
                          },
                          child: Icon(Icons.search)),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        height: 35,
                        width: 35,
                        child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(35)),
                            child: Image.asset("assets/avtar.png")),
                      )
                    ],
                  )
                ],
              ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        currentIndex: navIndex,
        onTap: (index) {
          setState(() {
            navIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.explore_outlined), label: "Explore"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Create"),
          BottomNavigationBarItem(
              icon: Icon(Icons.attach_money), label: "Subscriptions"),
          BottomNavigationBarItem(icon: Icon(Icons.wysiwyg), label: "Libray "),
        ],
      ),
      body:_isLoading== true?Center(child: CircularProgressIndicator(),) :ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
           Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => PlayVideo(item: items[index])),
  );
            },
            child: Container(
              height: 280,
              child: Card(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 200,
                        width: double.infinity,
                        color: Colors.grey,
                        child: Center(
                          child: Image.network(items[index].snippet.thumbnails.medium!.url!,fit: BoxFit.fitHeight),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "${items[index].snippet.title }",
                        maxLines: 2,
                        style:
                            TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "${items[index].snippet.channelTitle}",
                        style:
                            TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ]),
              ),
            ),
          );
        },
      ),
    );
  }
}




