import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget? child;
  final double width;
  final double height;
  final Color color;

  const ButtonWidget({
    Key? key,
    this.onTap,
    this.child,
    this.width = 200,
    this.height = 50,
    this.color = Colors.transparent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // 使用传入的回调函数
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20.0), // 圆角半径
          border: Border.all(color: Colors.blue), // 边框颜色
        ),
        child: child,
      ),
    );
  }
}
