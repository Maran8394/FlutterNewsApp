import "package:flutter/material.dart";
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news/networking.dart';
import 'package:news/screens/home_page.dart';
import '../network_constants.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  initState() {
    super.initState();
    getDatas();
  }

  void getDatas() async {
    FetchNews news = FetchNews(url: NetworkConstant.newsUrl);
    dynamic newsData = await news.getData();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomePage(
                  apiData: newsData,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.black,
      child: const SpinKitRing(
        color: Colors.white,
      ),
    );
  }
}
