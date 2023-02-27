import 'package:block_app_demo/common/screenutils/screen_util.dart';
import 'package:block_app_demo/presentation/journeys/home/home_screen.dart';
import 'package:block_app_demo/presentation/theme/app_colors.dart';
import 'package:block_app_demo/presentation/theme/theme_text.dart';
import 'package:flutter/material.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Movie App",
      theme: ThemeData(
        primaryColor: AppColor.vulcan,
        scaffoldBackgroundColor: AppColor.vulcan,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: ThemeText.getTextTheme(),
        appBarTheme: const AppBarTheme(elevation: 0),
      ),
      home: HomeScreen(),
    );
  }
}
