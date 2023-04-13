// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter30daychallange/pages/youtube/model/thumbnail_data.dart';

class Thumbnails {
  final ThumbnailData? medium;
  final ThumbnailData? high;

  Thumbnails({
    required this.medium,
    required this.high,
  });
  factory Thumbnails.fromJson(Map<String, dynamic> json) {
    return Thumbnails(
      high: ThumbnailData.fromJson(json['high']),
      medium: ThumbnailData.fromJson(json['medium']),
    );
  }
}
