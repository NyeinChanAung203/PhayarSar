import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phayarsar/core/routes/router.dart';
import 'package:phayarsar/features/phayarsar/domain/phayarsar_subtitle.dart';

class SubTitleScreen extends StatelessWidget {
  const SubTitleScreen(
      {super.key, required this.title, required this.phayarsarSubTitleList});
  final String title;

  final List<PhayarsarSubTitle> phayarsarSubTitleList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => const Divider(
          thickness: 0.5,
        ),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 4),
        itemBuilder: (context, index) => ListTile(
          onTap: () {
            context.pushNamed(AppRoutes.detail.name, pathParameters: {
              'groupId': phayarsarSubTitleList[index].groupId.toString(),
              'id': phayarsarSubTitleList[index].id.toString(),
            });
          },
          title: Text(phayarsarSubTitleList[index].title),
        ),
        itemCount: phayarsarSubTitleList.length,
      ),
    );
  }
}
