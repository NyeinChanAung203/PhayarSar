import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class PhayarsarSubTitle extends Equatable {
  final int id;
  final int groupId;
  final String title;
  const PhayarsarSubTitle({
    required this.id,
    required this.groupId,
    required this.title,
  });

  factory PhayarsarSubTitle.fromMap(Map<String, dynamic> map) {
    return PhayarsarSubTitle(
      id: map['id'] as int,
      groupId: map['groupId'] as int,
      title: map['title'] as String,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, groupId, title];
}
