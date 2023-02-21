import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:vbt_bloc_learn/core/network/network_manager.dart';
import 'package:vbt_bloc_learn/feature/post/model/user_model.dart';

import '../../model/post_model.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostInitial()) {
    _init();
  }
  final Dio dio = ProjectNetworkManager.instance.dio;
  List<PostModel>? postDatas;
  List<UserModel>? userDatas;

  bool isUser = false;
  bool isLoading = false;

  void changeLoading() {
    isLoading = !isLoading;
    emit(PostLoading());
  }

  void changeUserLoading() {
    isUser = !isUser;
    emit(IsUserService());
  }

  Future<List<PostModel>?> postService() async {
    try {
      var response = await dio.get("posts");
      postDatas = (response.data as List).map((e) => PostModel.fromJson(e)).toList();
      emit(PostService());
      return postDatas;
    } catch (e) {
      emit(PostService());
      throw Exception("Exception $e");
    }
  }

  Future<List<UserModel>?> userService() async {
    changeUserLoading();
    changeLoading();
    try {
      var response = await dio.get("todos");
      userDatas = (response.data as List).map((e) => UserModel.fromJson(e)).toList();
      changeLoading();
      emit(UserService());

      return userDatas;
    } catch (e) {
      emit(PostService());
      throw Exception("Exception $e");
    }
  }

  void _init() async {
    changeLoading();
    await postService();
    changeLoading();
  }
}
