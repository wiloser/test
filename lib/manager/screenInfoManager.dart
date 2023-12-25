import 'package:flutter/widgets.dart';

class ScreenInfoManager {
  // 私有构造函数
  ScreenInfoManager._privateConstructor();

  // 单例实例
  static final ScreenInfoManager _instance =
      ScreenInfoManager._privateConstructor();

  // 全局访问点
  static ScreenInfoManager get instance => _instance;

  // 获取屏幕宽度
  double get screenWidth {
    return MediaQuery.of(_context).size.width;
  }

  // 上下文，需要在应用程序启动时设置
  late BuildContext _context;

  // 初始化方法，在应用程序启动时调用
  void init(BuildContext context) {
    _context = context;
  }
}
