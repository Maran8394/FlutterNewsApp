import 'package:flutter/material.dart';
import 'package:news/screens/detail_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;
import '../network_constants.dart';
import '../networking.dart';
import '../custom_functions/utils.dart';
import '../widgets/image_render.dart';
import '../widgets/global_scaffold.dart';

class HomePage extends StatefulWidget {
  final dynamic apiData;
  const HomePage({
    required this.apiData,
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  dynamic _apiData;
  dynamic jsonData;
  dynamic results;
  final _controller = ScrollController();

  void setArticles(dynamic data) {
    _apiData = data;
    jsonData = Map.from(_apiData);
    results = jsonData['results'];
  }

  @override
  void initState() {
    super.initState();
    setArticles(widget.apiData);
  }

  @override
  void dispose() {
    super.dispose();
    print("STATE DESTROY");
  }

  Future<void> refreshCollectionItems() async {
    int pageNo = randomPageNumber();
    String pageUrl = NetworkConstant.newsUrl + "&page=$pageNo";
    FetchNews news = FetchNews(url: pageUrl);
    dynamic newsData = await news.getData();
    setState(() {
      setArticles(newsData);
    });
  }

  String publishedDt(String strDt) {
    DateTime parseDt = DateTime.parse(strDt);
    var newFormat = DateFormat("yyyy-MM-dd h:mm:ss");
    String updatedDt = newFormat.format(parseDt);
    return updatedDt.toString();
  }

  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      goBack: true,
      child: RefreshIndicator(
        color: Colors.black,
        onRefresh: refreshCollectionItems,
        child: ListView(controller: _controller, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                for (var i = 0; i < results.length; i++) ...[
                  InkWell(
                    onTap: () {
                      DetailsPage dd = DetailsPage(
                        articleData: results[i],
                      );
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => dd));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          NewsImage(
                            imageUrl: results[i]['image_url'],
                            keywords: results[i]["keywords"],
                            category: results[i]["category"],
                          ),
                          const SizedBox(height: 10),
                          Text("${results[i]["title"]}",
                              style: GoogleFonts.dmSans(
                                textStyle: const TextStyle(
                                  color: Color(0xFF000000),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  fontStyle: FontStyle.normal,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              textAlign: TextAlign.left,
                              textDirection: ui.TextDirection.ltr,
                              maxLines: 5),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                              "Published on : ${publishedDt(results[i]["pubDate"])}",
                              style: GoogleFonts.dmSans(
                                textStyle: const TextStyle(
                                  color: Color(0xFF000000),
                                  fontSize: 13,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                              textAlign: TextAlign.left,
                              textDirection: ui.TextDirection.ltr,
                              maxLines: 2),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 15.0),
                ]
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
