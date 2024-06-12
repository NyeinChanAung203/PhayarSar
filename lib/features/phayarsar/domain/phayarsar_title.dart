import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'package:phayarsar/features/phayarsar/domain/phayarsar_subtitle.dart';

@immutable
class PhayarsarTitle extends Equatable {
  final int groupId;
  final String title;
  final List<PhayarsarSubTitle> data;
  const PhayarsarTitle({
    required this.groupId,
    required this.title,
    required this.data,
  });

  factory PhayarsarTitle.fromMap(Map<String, dynamic> map) {
    return PhayarsarTitle(
      groupId: map['groupId'] as int,
      title: map['title'] as String,
      data: List<PhayarsarSubTitle>.from(
        (map['data'] as List<dynamic>).map<PhayarsarSubTitle>(
          (x) => PhayarsarSubTitle.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [groupId, title, data];
}
