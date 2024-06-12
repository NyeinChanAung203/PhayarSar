import 'package:phayarsar/core/utils/ref/cached_with_timeout.dart';
import 'package:phayarsar/features/phayarsar/data/phayarsar_repository.dart';
import 'package:phayarsar/features/phayarsar/domain/phayarsar_detail.dart';
import 'package:phayarsar/features/phayarsar/domain/phayarsar_title.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'phayarsar_controller.g.dart';

@Riverpod(keepAlive: true)
FutureOr<List<PhayarsarTitle>> phayarsarTitleController(
    PhayarsarTitleControllerRef ref) {
  return ref.read(phayarsarRepositoryProvider).fetchAllTitles();
}

@riverpod
class PhayarsarDetailController extends _$PhayarsarDetailController {
  @override
  FutureOr<PhayarsarDetail> build({
    required String groupId,
    required String id,
  }) {
    ref.cachedFor(const Duration(minutes: 1));
    return ref
        .read(phayarsarRepositoryProvider)
        .fetchDetail(groupId: groupId, id: id);
  }
}
