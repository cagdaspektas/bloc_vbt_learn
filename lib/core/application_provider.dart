import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:vbt_bloc_learn/core/network/network_manager.dart';

class ApplicationProvider {
  final List<SingleChildWidget> items = [
    Provider<Dio>(
      create: (context) => ProjectNetworkManager.instance.dio,
    )
  ];
}
