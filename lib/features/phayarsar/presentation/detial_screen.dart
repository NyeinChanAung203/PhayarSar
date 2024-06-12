import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phayarsar/core/common/error_message_widget.dart';
import 'package:phayarsar/core/common/loading_widget.dart';
import 'package:phayarsar/features/phayarsar/presentation/controllers/phayarsar_controller.dart';
import 'package:gap/gap.dart';

class PhayarsarDetailScreen extends ConsumerStatefulWidget {
  const PhayarsarDetailScreen(
      {super.key, required this.groupId, required this.id});

  final String groupId;
  final String id;

  @override
  ConsumerState<PhayarsarDetailScreen> createState() =>
      _PhayarsarDetailScreenState();
}

class _PhayarsarDetailScreenState extends ConsumerState<PhayarsarDetailScreen> {
  double fontTitleSize = 24;
  double fontContentSize = 16;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                if (fontContentSize >= 12) {
                  setState(() {
                    fontTitleSize -= 2;
                    fontContentSize -= 2;
                  });
                }
              },
              icon: const Icon(Icons.remove),
            ),
            IconButton(
              onPressed: () {
                if (fontContentSize <= 20) {
                  setState(() {
                    fontTitleSize += 2;
                    fontContentSize += 2;
                  });
                }
              },
              icon: const Icon(Icons.add),
            ),
            const Gap(8),
          ],
        ),
        body: ref
            .watch(phayarsarDetailControllerProvider(
                groupId: widget.groupId.toString(), id: widget.id.toString()))
            .when(
              data: (data) => SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Gap(16),
                      Text(
                        data.title,
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  fontSize: fontTitleSize,
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
                      const Gap(40),
                      Text(
                        data.content,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontSize: fontContentSize,
                            ),
                      ),
                      const Gap(40),
                    ],
                  ),
                ),
              ),
              error: (error, stackTrace) => ErrorMessageWidget(error, () {
                ref.invalidate(phayarsarDetailControllerProvider(
                    groupId: widget.groupId.toString(),
                    id: widget.id.toString()));
              }),
              loading: () => const LoadingWidget(),
            ));
  }
}
