import 'package:flutter/material.dart';

class AnimationBuilderExamplpe extends StatefulWidget {
  const AnimationBuilderExamplpe({super.key});

  @override
  State<AnimationBuilderExamplpe> createState() =>
      _AnimationBuilderExamplpeState();
}

class _AnimationBuilderExamplpeState extends State<AnimationBuilderExamplpe>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: Duration(milliseconds: 1500),
      vsync: this,
    );
    final animationCurve = CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInExpo,
        reverseCurve: Curves.easeInExpo);
    _animation = Tween<double>(begin: 5, end: 100).animate(animationCurve)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _animationController.forward();
        }
      });
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0,_animation.value),
           
            child: Center(
              child: Icon(Icons.heart_broken,size: 100,),
            ),
          );
        },
      ),
    );
  }
}
