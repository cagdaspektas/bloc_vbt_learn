part of 'post_cubit.dart';

@immutable
abstract class PostState {}

class PostInitial extends PostState {}

class PostService extends PostState {}

class UserService extends PostState {}

class PostLoading extends PostState {}

class IsUserService extends PostState {}
