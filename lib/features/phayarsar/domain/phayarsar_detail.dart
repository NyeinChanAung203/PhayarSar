import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class PhayarsarDetail extends Equatable {
  final int id;
  final int groupId;
  final String title;
  final String content;
  const PhayarsarDetail({
    required this.id,
    required this.groupId,
    required this.title,
    required this.content,
  });

  factory PhayarsarDetail.fromMap(Map<String, dynamic> map) {
    return PhayarsarDetail(
      id: map['id'] as int,
      groupId: map['groupId'] as int,
      title: map['title'] as String,
      content: map['content'] as String,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, groupId, title, content];
}
