import 'package:dio/dio.dart';

class ProjectNetworkManager {
  static ProjectNetworkManager? _instace;
  static ProjectNetworkManager get instance {
// ignore: prefer_conditional_assignment
    if (_instace == null) _instace = ProjectNetworkManager._init();
    return _instace!;
  }

  final String _baseUrl = "https://jsonplaceholder.typicode.com/";

  late final Dio dio;

  ProjectNetworkManager._init() {
    dio = Dio(BaseOptions(baseUrl: _baseUrl));
  }
}
