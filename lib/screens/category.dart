import 'dart:ui';

import 'package:basics/components/news_card.dart';
import 'package:basics/helper/news.dart';
import 'package:basics/models/news_article_model.dart';
import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';

class Category extends StatefulWidget {

  final String category;
  final String imageURL;

  const Category({super.key, required this.category, required this.imageURL});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {

  List<NewsArticleModel> articles = [];
  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategoryNews();
  }

  getCategoryNews() async {
    CategoryNews news = CategoryNews();
    await news.getNews(widget.category);
    articles = news.newsList;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Stack(
        children: [
          Hero(
            tag: 'news',
            child: Image.network(
              widget.imageURL,
              height: height * 0.4,
              width: width,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: height * 0.4,
            width: width,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
              child: Container(
                // decoration: BoxDecoration(
                //   border: Border.all(color: Colors.white.withOpacity(0.2)),
                //   borderRadius: BorderRadius.circular(10),
                //   gradient: LinearGradient(
                //     begin: Alignment.topLeft,
                //     end: Alignment.bottomRight,
                //     colors: [
                //       Colors.white.withOpacity(0.3),
                //       Colors.white.withOpacity(0.1),
                //     ],
                //   ),
                // ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 1,
                    sigmaY: 1,
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "${widget.category.substring(0,1).toUpperCase()}${widget.category.substring(1)}.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: height * 0.7,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(20),
              ),
              child: _loading ? Center(
                child: Container(
                  height: 100,
                  width: 100,
                  child: LiquidCircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.black), // Defaults to the current Theme's accentColor.
                    backgroundColor: Colors.grey, // Defaults to the current Theme's backgroundColor.
                  ),
                ),
              ) : Center(
                child: Expanded(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: articles.length,
                        itemBuilder: (context, index) {
                          return NewsCard(
                            imageURL: articles[index].urlToImage,
                            title: articles[index].title,
                            description: articles[index].description,
                            name: articles[index].source,
                            publishedAt: articles[index].publishedAt,
                            url: articles[index].url,
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
