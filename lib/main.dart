
import 'dart:async';

import 'package:block_app_demo/presentation/movie_app.dart';
import 'package:flutter/material.dart';
import 'di/get_it.dart' as getIt;

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  unawaited(getIt.init());
  runApp(const MovieApp());
}
