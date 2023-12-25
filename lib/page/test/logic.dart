import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../api/api.dart';
import 'state.dart';

class TestLogic extends GetxController {
  final TestState state = TestState();

  @override
  void onInit() {
    super.onInit();
  }

  void searchData({String? data}) async {
    state.data = await searchMovies(key: data);
    print(state.data);
    print(state.data['count']);
    print(state.data['subjects']);
    state.movies.clear();
    for (var data in state.data['subjects']) {
      print(data);
      state.movies.add(data);
      data['genres'].toString();
    }
    state.count.value = state.movies.length;
  }

  String toText(var movie) {
    String text = '';
    for (var classText in movie['genres']) {
      text = text + classText.toString() + ' / ';
    }
    for (var director in movie['directors']) {
      text = text + director['name'].toString() + ' / ';
    }
    return text;
  }

  void toWeb(var movie) async {
    var httpsUri = Uri(
        scheme: 'https',
        host: '',
        path: '/guides/libraries/library-tour',
        fragment: 'numbers');
    print(httpsUri);
    if (await canLaunchUrl(httpsUri)) {
      await launchUrl(httpsUri);
    } else {
      throw '无法打开网页：$httpsUri';
    }
  }
}
