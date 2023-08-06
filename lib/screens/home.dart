import 'package:analog_clock/analog_clock.dart';
import 'package:basics/components/news_card.dart';
import 'package:basics/helper/data.dart';
import 'package:basics/helper/news.dart';
import 'package:basics/models/category_model.dart';
import 'package:basics/models/news_article_model.dart';
import 'package:basics/components/category_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<CategoryModel> categories = [];
  List<NewsArticleModel> articles = [];

  bool _loading = true;

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNews();
  }

  getNews() async {
    News news = News();
    await news.getNews();
    articles = news.newsList;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        surfaceTintColor: Colors.grey.shade300,
        automaticallyImplyLeading: false,
        toolbarHeight: 180,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Hero(
              tag: 'logo',
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade600,
                        offset: const Offset(4, 4),
                        blurRadius: 8,
                        spreadRadius: 1,
                      ),
                      const BoxShadow(
                          color: Colors.white,
                          offset: Offset(-4, -4),
                          blurRadius: 8,
                          spreadRadius: 1
                      ),
                    ],
                  ),
                  child: Text(
                    'Basics.',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.nunito().fontFamily,
                    ),
                  ),
                ),
              ),
            ),
            AnalogClock(
              decoration: BoxDecoration(
                  border: Border.all(width: 1.5, color: Colors.black),
                  color: Colors.transparent,
                  shape: BoxShape.circle),
              width: 150,
              height: 150,
              isLive: true,
              hourHandColor: Colors.black,
              minuteHandColor: Colors.black,
              secondHandColor: Colors.blueGrey,
              showSecondHand: true,
              numberColor: Colors.black87,
              showNumbers: false,
              showAllNumbers: false,
              textScaleFactor: 1.5,
              showTicks: true,
              tickColor: Colors.blueGrey.shade800,
              showDigitalClock: false,
              datetime: DateTime(2019, 1, 1, 9, 12, 15),
            ),
          ],
        ),
      ),
      body: _loading ? Center(
        child: Container(
          height: 100,
          width: 100,
          child: LiquidCircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.black), // Defaults to the current Theme's accentColor.
            backgroundColor: Colors.grey, // Defaults to the current Theme's backgroundColor.
          ),
        ),
      ) : Center(
        child: Column(
          children: [
            Container(
              height: 100,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return CategoryTile(
                    imageURL: categories[index].imageURL,
                    categoryName: categories[index].categoryName,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Top Headlines.',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
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
          ],
        ),
      ),
    );
  }
}
