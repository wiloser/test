import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_work/customWidget/testCard.dart';

import 'logic.dart';

class TestPage extends StatelessWidget {
  final logic = Get.put(TestLogic());
  final state = Get.find<TestLogic>().state;

  TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Column(
          children: [
            searchContainer(),
            Container(
              height: 1,
              color: Colors.black12,
            ),
            Obx(() => showList()),
          ],
        ),
      ),
    );
  }

  Widget searchContainer() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: '请输入搜索关键字',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        onChanged: (value){
          logic.searchData(data: value);
        },
      ),
    );
  }

  Widget showList({List? data}) {
    return Expanded(
      child: ListView.separated(
        itemCount: state.count.value,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: TestCard(
              name: state.movies[index]['title'] ?? '',
              imageUrl: 'https://www.jibing57.com/images/Hexo/douban_image_showed_in_chrome.png',
              stars: state.movies[index]['rating']['average'] / 2,
              classText: logic.toText(state.movies[index]),
              // onTap: (value) => logic.toWeb('1'),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: Colors.grey.shade100,
            thickness: 1.0,
          );
        },
      ),
    );
  }
}
