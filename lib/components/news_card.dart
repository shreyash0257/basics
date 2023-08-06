import 'package:basics/screens/news_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsCard extends StatelessWidget {

  final String imageURL;
  final String title;
  final String description;
  final String name;
  final String publishedAt;
  final String url;

  const NewsCard({super.key, required this.imageURL, required this.title, required this.description, required this.name, required this.publishedAt, required this.url,});

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 10,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => NewsScreen(
              imageURL: imageURL,
              title: title,
              description: description,
              name: name,
              publishedAt: publishedAt,
              url: url,
            ),
          ),
          );
        },
        child: Hero(
          tag: 'news',
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  imageURL,
                  height: 200,
                  width: width - 20,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: width - 20,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontFamily: GoogleFonts.inconsolata().fontFamily,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
