import 'package:flutter/material.dart';
import 'networking.dart';
import 'network_constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var networkConstants = NetworkConstant();
  @override
  initState() {
    super.initState();
    gettingData();
  }

  Future<Map> gettingData() async {
    var completeUrl = networkConstants.url;
    FetchNews newsData = FetchNews(url: completeUrl);
    var data = await newsData.getData();
    var responseData = Map.from(data);
    return responseData;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Newsy',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(title: 'Newsy'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List ListofNews() {
    List<Widget> newsList = [];
    for (var i = 0; i < 10; i++) {
      Card c = const Card(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: ListTile(
            leading: Text("img"),
            title: Text("title"),
            trailing: Text("published date"),
          ),
        ),
      );
      newsList.add(c);
    }
    return newsList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Card(
            elevation: 0.8,
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: ListTile(
                leading: const Icon(Icons.search),
                title: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Search",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          Card(
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  height: 70.0,
                  width: 70.0,
                  child: Image.network(
                      "https://static.toiimg.com/thumb/msid-92042160,width-1070,height-580,imgsize-216308,resizemode-75,overlay-toi_sw,pt-32,y_pad-40/photo.jpg"),
                ),
              ),
              title: Text(
                  "Apple WWDC 2022 updates: M2 powered MacBook Air may face supply constraints; rumoured to come in four col - Times of India"),
            ),
          ),
        ],
      ),
    );
  }
}
