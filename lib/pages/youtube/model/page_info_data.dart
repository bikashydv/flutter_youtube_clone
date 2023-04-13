import 'package:flutter/material.dart';

class PageInfoData {
  final int totalResults;
  final int resultsPerPage;

  PageInfoData({required this.totalResults, required this.resultsPerPage});
  factory PageInfoData.fromJson(Map<String, dynamic> json) {
    return PageInfoData(
        totalResults: json['resultsPerPage'],
        resultsPerPage: json['resultsPerPage']);
  }
}
