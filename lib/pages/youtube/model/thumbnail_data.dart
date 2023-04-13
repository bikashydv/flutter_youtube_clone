// ignore_for_file: public_member_api_docs, sort_constructors_first
class ThumbnailData {
  final String? url;
  final int? width;
  final int? height;

  ThumbnailData({
    required this.url,
    required this.width,
    required this.height,
  });

  factory ThumbnailData.fromJson(Map<String, dynamic> json) {
    return ThumbnailData(
      url: json['url'],
      width: json['width'],
      height: json['height'],
    );
  }
}

// type 'int' is not a subtype of type 'String' ?