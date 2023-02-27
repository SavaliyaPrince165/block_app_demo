import 'package:block_app_demo/common/screenutils/screen_util.dart';

extension SizeExtension on num {
  get w => ScreenUtil().setWidth(this);

  get h => ScreenUtil().setHeight(this);

  get sp => ScreenUtil().setSp(this);
}
