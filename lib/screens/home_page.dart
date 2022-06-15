import 'package:flutter/material.dart';
import 'package:news/controls/asset_paths.dart';
import 'package:news/screens/detail_page.dart';

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
  String getImageUrl(String? url) {
    if (url != null) {
      return url;
    } else {
      return AssetPaths.dummyImage;
    }
  }

  String getContent(String description, String? content, String url) {
    if (description != content) {
      if (content == null) {
        return url;
      }
      return content;
    } else {
      return url;
    }
  }

  @override
  Widget build(BuildContext context) {
    dynamic data = widget.apiData;
    Map jsonData = Map.from(data);
    dynamic results = jsonData['results'];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Newsy"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                for (var i = 0; i < results.length; i++) ...[
                  InkWell(
                    onTap: () {
                      DetailsPage dd = DetailsPage(
                        title: results[i]["title"],
                        description: results[i]["description"],
                        imageUrl: getImageUrl(results[i]['image_url']),
                        content: getContent(
                          results[i]['description'],
                          results[i]['content'],
                          results[i]['link'],
                        ),
                      );
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => dd));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          // top: BorderSide(
                          //     width: 1.0, color: Colors.grey.shade400),
                          bottom: BorderSide(
                              width: 1.0, color: Colors.grey.shade400),
                        ),
                        // color: Colors.white,
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 150,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(
                                      10.0)), //add border radius here
                              child: Image.network(
                                  getImageUrl(results[i]['image_url'])),
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Text(
                            "${results[i]["title"]}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 15.0),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}
