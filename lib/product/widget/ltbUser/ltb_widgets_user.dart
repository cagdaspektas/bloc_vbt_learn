import 'package:flutter/material.dart';
import 'package:vbt_bloc_learn/feature/post/model/user_model.dart';

class CustomUserListView extends StatelessWidget {
  final int? itemCount;
  final List<UserModel>? text1;
  const CustomUserListView({super.key, this.itemCount, this.text1});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemCount,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            Row(
              children: [Text(text1?[index].title.toString() ?? "")],
            )
          ],
        );
      },
    );
  }
}
