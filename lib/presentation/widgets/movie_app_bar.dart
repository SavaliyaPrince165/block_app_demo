import 'package:block_app_demo/common/constants/size_constants.dart';
import 'package:block_app_demo/common/extensions/size_extensions.dart';
import 'package:block_app_demo/common/screenutils/screen_util.dart';
import 'package:block_app_demo/presentation/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MovieAppBar extends StatelessWidget {
  const MovieAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: ScreenUtil.statusBarHeight + Sizes.dimen_4.h,
        left: Sizes.dimen_16.w,
        right: Sizes.dimen_16.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              "assets/png/menu.png",
              height: Sizes.dimen_12.h,
              color: Colors.white,
            ),
          ),
          Text(
            "Movie",
            style: TextStyle(
              color: Colors.white,
              fontSize: Sizes.dimen_12.h,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.white,
              size: Sizes.dimen_12.h,
            ),
          ),
        ],
      ),
    );
  }
}
