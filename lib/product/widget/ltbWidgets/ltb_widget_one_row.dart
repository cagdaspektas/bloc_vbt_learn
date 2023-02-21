import 'package:flutter/material.dart';

import '../../../feature/post/model/post_model.dart';

class CustomListView extends StatelessWidget {
  final int? itemCount;
  final List<PostModel>? text1;
  const CustomListView({super.key, this.itemCount, this.text1});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemCount,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            Row(
              children: [Text(text1?[index].id.toString() ?? "")],
            )
          ],
        );
      },
    );
  }
}
