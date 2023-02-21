import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/application_provider.dart';
import 'feature/post/view/post_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(
    providers: ApplicationProvider().items,
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.

        primarySwatch: Colors.red,
      ),
      home: const PostView(),
    );
  }
}
