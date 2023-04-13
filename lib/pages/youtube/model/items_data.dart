// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter30daychallange/pages/youtube/model/id_data.dart';
import 'package:flutter30daychallange/pages/youtube/model/snippet_data.dart';

class ItemData {
  final String kind;
  final String etag;
  final IdData id;
  final SnippetData snippet;
  ItemData({
    required this.kind,
    required this.etag,
    required this.id,
    required this.snippet,
  });

  factory ItemData.fromJson(Map<String, dynamic> json) {
    return ItemData(
      etag: json['etag'],
      kind: json['kind'],
      id: IdData.fromJson(json['id']),
      snippet: SnippetData.fromJson(json['snippet']),
    );
  }
}
