import 'package:apidata/model/apple.dart';
import 'package:apidata/model/wsj.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AppleProvider extends ChangeNotifier {
  static const apiEndpoints =
      'https://newsapi.org/v2/everything?q=apple&from=2024-04-16&to=2024-04-16&sortBy=popularity&apiKey=25bc50e6962940729bdc168ed72c13b2';
  bool isloading = true;
  String error = '';
  Apple apple = Apple(articles: []);

  Apple searchapple = Apple(
    articles: [],
  );
  String searchText = '';

  getDataFromApi() async {
    try {
      Response responseitem = await http.get(Uri.parse(apiEndpoints));

      if (responseitem.statusCode == 200) {
        apple = appleFromJson(responseitem.body);

        print(apple);
      } else {
        error = responseitem.statusCode.toString();
      }
    } catch (e) {
      error = e.toString();
    }
    isloading = false;
    updatedata();
    //notifyListeners();
  }

  updatedata() {
    searchapple.articles.clear();
    if (searchText.isEmpty) {
      searchapple.articles.addAll(apple.articles);
    } else {
      searchapple.articles.addAll(apple.articles
          .where(
              (element) => element.title!.toLowerCase().startsWith(searchText))
          .toList());
    }
    notifyListeners();
  }

  search(String title) {
    searchText = title.toLowerCase();
    updatedata();
  }
}
