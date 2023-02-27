import 'package:block_app_demo/common/extensions/size_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Logo extends StatelessWidget {
  final double height;
  const Logo({
    super.key,
    required this.height,
  })  : assert(height != null, 'height must not be null'),
        assert(height > 0, 'height shold be greater than 0');

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/png/logo.png',
      color: Colors.white,
      height: height.h,
    );
  }
}
