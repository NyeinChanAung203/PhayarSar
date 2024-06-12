import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:phayarsar/core/utils/dio/dio_provider.dart';
import 'package:phayarsar/features/phayarsar/domain/phayarsar_detail.dart';
import 'package:phayarsar/features/phayarsar/domain/phayarsar_title.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'phayarsar_repository.g.dart';

@riverpod
PhayarsarRepository phayarsarRepository(PhayarsarRepositoryRef ref) {
  final dio = ref.read(dioProviderProvider);
  return PhayarsarRepository(dio: dio);
}

class PhayarsarRepository {
  final Dio dio;

  const PhayarsarRepository({required this.dio});

  Future<List<PhayarsarTitle>> fetchAllTitles() async {
    final resp = await dio.get('/data.json');

    return (jsonDecode(resp.data) as List)
        .map((e) => PhayarsarTitle.fromMap(e))
        .toList();
  }

  Future<PhayarsarDetail> fetchDetail({
    required String groupId,
    required String id,
  }) async {
    final resp = await dio.get('/$groupId/$id.json');
    return PhayarsarDetail.fromMap(jsonDecode(resp.data));
  }
}
