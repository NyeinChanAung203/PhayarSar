import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phayarsar/core/common/error_message_widget.dart';
import 'package:phayarsar/core/common/loading_widget.dart';
import 'package:phayarsar/core/providers/theme_provider.dart';
import 'package:phayarsar/core/routes/router.dart';
import 'package:phayarsar/features/phayarsar/presentation/controllers/phayarsar_controller.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PhayarSar'),
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset(
            'assets/favicon.png',
          ),
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: const Text('Light'),
                  onTap: () async {
                    await ref
                        .read(themeControllerProvider.notifier)
                        .changeTheme(ThemeMode.light);
                  },
                ),
                PopupMenuItem(
                  child: const Text('Dark'),
                  onTap: () async {
                    await ref
                        .read(themeControllerProvider.notifier)
                        .changeTheme(ThemeMode.dark);
                  },
                ),
                PopupMenuItem(
                  child: const Text('System'),
                  onTap: () async {
                    await ref
                        .read(themeControllerProvider.notifier)
                        .changeTheme(ThemeMode.system);
                  },
                ),
              ];
            },
          )
        ],
      ),
      body: ref.watch(phayarsarTitleControllerProvider).when(
            data: (data) {
              if (data.isEmpty) {
                return const Center(
                  child: Text('Empty'),
                );
              }

              return ListView.separated(
                separatorBuilder: (context, index) => const Divider(
                  thickness: 0.5,
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 4),
                itemBuilder: (context, index) => ListTile(
                  title: Text(data[index].title),
                  onTap: () {
                    context.pushNamed(
                      AppRoutes.subTitle.name,
                      pathParameters: {'title': data[index].title},
                      extra: data[index].data,
                    );
                  },
                ),
                itemCount: data.length,
              );
            },
            error: (error, stackTrace) => ErrorMessageWidget(error, () {
              ref.invalidate(phayarsarTitleControllerProvider);
            }),
            loading: () => const LoadingWidget(),
          ),
      bottomSheet: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Version 1.0.0\n  © 2024 Burma Blazor Team',
          style: Theme.of(context).textTheme.labelSmall,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
