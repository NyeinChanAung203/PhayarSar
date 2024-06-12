import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';

extension AutoDisposeRefCache on AutoDisposeRef {
  void cachedFor(Duration duration) {
    final link = keepAlive();
    final timer = Timer(duration, () => link.close());
    onDispose(() => timer.cancel());
  }
}
