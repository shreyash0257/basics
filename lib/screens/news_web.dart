import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsWeb extends StatefulWidget {

  final String url;
  final String name;

  const NewsWeb({super.key, required this.url, required this.name,});

  @override
  State<NewsWeb> createState() => _NewsWebState();
}

class _NewsWebState extends State<NewsWeb> {

  late WebViewController webViewController;

  late String finalUrl;

  @override
  void initState() {
    super.initState();

    if(widget.url.toString().contains("http://")) {
      finalUrl = widget.url.toString().replaceAll("http://", "https://");
    } else {
      finalUrl = widget.url;
    }

    webViewController = WebViewController()
      ..setBackgroundColor(Colors.grey.shade300)
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(finalUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        centerTitle: true,
        title: Text(widget.name),
      ),
      body: WebViewWidget(
        controller: webViewController,
      ),
    );
  }
}
