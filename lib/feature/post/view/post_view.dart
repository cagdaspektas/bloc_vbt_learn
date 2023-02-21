import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../product/widget/ltbUser/ltb_widgets_user.dart';
import '../../../product/widget/ltbWidgets/ltb_widget_one_row.dart';
import '../viewModel/cubit/post_cubit.dart';

class PostView extends StatelessWidget {
  const PostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => PostCubit(),
        child: BlocConsumer<PostCubit, PostState>(
          listener: (context, state) {},
          builder: (context, state) {
            return context.read<PostCubit>().isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                    color: Colors.red,
                  ))
                : Column(
                    children: [
                      Expanded(
                        child: context.read<PostCubit>().isUser
                            ? CustomUserListView(
                                itemCount: context.read<PostCubit>().userDatas?.length,
                                text1: context.read<PostCubit>().userDatas,
                              )
                            : CustomListView(
                                itemCount: context.read<PostCubit>().postDatas?.length,
                                text1: context.read<PostCubit>().postDatas,
                              ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            context.read<PostCubit>().userService();
                          },
                          child: const Text("dwdawdw"))
                    ],
                  );
          },
        ),
      ),
    );
  }
}
