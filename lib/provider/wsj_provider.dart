import 'package:apidata/model/wsj.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class WsjProvider extends ChangeNotifier {
  static const apiEndpoints =
      'https://newsapi.org/v2/everything?domains=wsj.com&apiKey=25bc50e6962940729bdc168ed72c13b2';
  bool isloading = true;
  String error = '';
  Wsj wsj = Wsj(articles: []);

  Wsj searchwsj = Wsj(
    articles: [],
  );
  String searchText = '';

  getDataFromApi() async {
    print("datacalled");
    try {
      Response responseitem = await http.get(Uri.parse(apiEndpoints));

      if (responseitem.statusCode == 200) {
        wsj = wsjFromJson(responseitem.body);

        print(wsj);
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
    searchwsj.articles.clear();
    if (searchText.isEmpty) {
      searchwsj.articles.addAll(wsj.articles);
    } else {
      searchwsj.articles.addAll(wsj.articles
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
