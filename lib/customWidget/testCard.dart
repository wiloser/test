import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TestCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String classText;
  final double stars;

  const TestCard({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.classText,
    required this.stars,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _launchURL('https://api.flutter.dev/flutter/dart-core/Uri-class.html');
      },
      child: Row(
        children: [
          Container(
            width: 50,
            height: 60,
            color: Colors.red,
            child: Image.network(
              imageUrl,
              errorBuilder: (context, error, stackTrace) {
                print(error);
                return Text('加载失败');
              },
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          textContent(),
        ],
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw '无法打开网页：$url';
    }
  }

  Widget textContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(
              Icons.slow_motion_video,
              color: Colors.pink,
            ),
            Text(
              name,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        Row(
          children: [
            StarsContainer(
              stars: stars,
            ),
            Text(
              (stars * 2).toString(),
              style: const TextStyle(
                color: Colors.orangeAccent,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text('电影'),
            SizedBox(
              width: 20,
            ),
            SizedBox(
              width: 200,
              child: Text(
                classText,
                style: TextStyle(color: Colors.grey),
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ],
    );
  }
}

class StarsContainer extends StatelessWidget {
  final double stars;

  // 构造函数，传入评分
  const StarsContainer({Key? key, required this.stars}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 获取星星的整数部分和小数部分
    int fullStars = stars.floor();
    double decimalPart = stars - fullStars;

    // 创建一个 Row，包含整数部分的星星
    Widget fullStarsRow = Row(
      children: List.generate(
        fullStars,
        (index) => Icon(
          Icons.star,
          color: Colors.orangeAccent,
          size: 20.0,
        ),
      ),
    );

    // 如果小数部分大于 0，则添加一个半星
    Widget halfStar = decimalPart > 0
        ? Icon(
            Icons.star_half,
            color: Colors.orangeAccent,
            size: 20.0,
          )
        : Container();

    // 创建一个 Row，包含整数部分的星星
    Widget fullVoidStarsRow = Row(
      children: List.generate(
        5 - fullStars - (decimalPart > 0 ? 1 : 0),
        (index) => Icon(
          Icons.star_border,
          color: Colors.orangeAccent,
          size: 20.0,
        ),
      ),
    );

    // 创建一个 Row，包含整数部分和可能的半星
    Widget starsRow = Row(
      children: [
        fullStarsRow,
        halfStar,
        fullVoidStarsRow,
      ],
    );

    // 包装在一个容器中，并返回
    return Container(
      child: starsRow,
    );
  }
}
