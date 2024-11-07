import 'package:flutter/material.dart';
import '/src/utils/route_manager.dart';
import 'app.dart';

Future<void> main() async {
  RouteManager.instance.initialize();
  runApp(const App());
}


