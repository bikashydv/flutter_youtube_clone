// ignore_for_file: public_member_api_docs, sort_constructors_first
class IdData {
  final String kind;
  final String channelId;
  IdData({
    required this.kind,
    required this.channelId,
  });

  factory IdData.fromJson(Map<String, dynamic> json) {
    return IdData(
      kind: json['kind'],
      channelId: json['channelId'].toString(),
    );
  }
}
