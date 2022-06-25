import 'package:flutter/material.dart';
import '../controls/asset_paths.dart';
import 'package:google_fonts/google_fonts.dart';

import '../network_constants.dart';
import '../networking.dart';
import '../screens/home_page.dart';

class GlobalScaffold extends StatelessWidget {
  final Widget child;
  final bool goBack;
  const GlobalScaffold({required this.child, Key? key, required this.goBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: goBack,
        title: const Text("Newsy"),
        toolbarOpacity: 0.8,
        backgroundColor: const Color(0XFF00194E),
      ),
      drawer: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.7,
          child: Drawer(
            child: ListView(
              padding: const EdgeInsets.all(0),
              children: [
                // const DrawerHeader(
                //   decoration: BoxDecoration(
                //     color: Colors.green,
                //   ), //BoxDecoration
                //   child: UserAccountsDrawerHeader(
                //     decoration: BoxDecoration(color: Colors.green),
                //     accountName: Text(
                //       "Abhishek Mishra",
                //       style: TextStyle(fontSize: 18),
                //     ),
                //     accountEmail: Text("abhishekm977@gmail.com"),
                //     currentAccountPictureSize: Size.square(50),
                //     currentAccountPicture: CircleAvatar(
                //       backgroundColor: Color.fromARGB(255, 165, 255, 137),
                //       child: Text(
                //         "A",
                //         style: TextStyle(fontSize: 30.0, color: Colors.blue),
                //       ), //Text
                //     ), //circleAvatar
                //   ), //UserAccountDrawerHeader
                // ), //DrawerHeader
                // ListTile(
                //   leading: const Icon(Icons.person),
                //   title: const Text(' My Profile '),
                //   onTap: () {
                //     Navigator.pop(context);
                //   },
                // ),
                for (var i in AssetPaths.catAndIcon.entries) ...[
                  ListTile(
                    leading: Icon(
                      i.value,
                      color: const Color(0XFF00194E),
                    ),
                    title: Text(
                      AssetPaths.capitalize(i.key),
                      style: GoogleFonts.dmSans(
                        textStyle: const TextStyle(
                          color: Color(0xFF000000),
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                    onTap: () async {
                      String pageUrl =
                          NetworkConstant.getNewsWithCategory + i.key;
                      FetchNews news = FetchNews(url: pageUrl);
                      dynamic newsData = await news.getData();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePage(
                                    apiData: newsData,
                                  )));
                    },
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        top: true,
        child: child,
      ),
    );
  }
}
