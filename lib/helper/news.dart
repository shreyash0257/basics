import 'dart:convert';

import 'package:basics/models/news_article_model.dart';
import 'package:http/http.dart' as http;

String APIKey = 'Your API Key';

class News {
  List<NewsArticleModel> newsList = [];

  Future<void> getNews() async {
    String url = "https://newsapi.org/v2/top-headlines?country=in&apiKey=$APIKey";
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if(response.statusCode == 200) {

      jsonData["articles"].forEach((element){

        if(element["urlToImage"] != null && element["description"] != null) {

          NewsArticleModel newsArticleModel = NewsArticleModel(
            title: element["title"],
            source: element["source"]["name"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            publishedAt: element["publishedAt"],
          );

          newsList.add(newsArticleModel);

        }

      });
    }
  }


}

class CategoryNews {
  List<NewsArticleModel> newsList = [];

  Future<void> getNews(String category) async {
    String url = "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=$APIKey";
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if(response.statusCode == 200) {

      jsonData["articles"].forEach((element){

        if(element["urlToImage"] != null && element["description"] != null) {

          NewsArticleModel newsArticleModel = NewsArticleModel(
            title: element["title"],
            source: element["source"]["name"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            publishedAt: element["publishedAt"],
          );

          newsList.add(newsArticleModel);

        }

      });
    }
  }


}