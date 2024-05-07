import 'package:flutter/material.dart';
import 'package:yamaha_auth_module/flutter_method_channel_handler.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    FlutterMethodChannelHandler.setUpMethodChannel();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Future<String> getSomething() async {
    return "Result";
  }
}
