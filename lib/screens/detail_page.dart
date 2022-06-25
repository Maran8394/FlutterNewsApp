import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import '../widgets/image_render.dart';
import '../widgets/global_scaffold.dart';

class DetailsPage extends StatefulWidget {
  final Map articleData;
  const DetailsPage({
    required this.articleData,
    Key? key,
  }) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
        goBack: true,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    NewsImage(
                      imageUrl: widget.articleData['image_url'],
                      keywords: widget.articleData["keywords"],
                      category: widget.articleData["category"],
                    ),
                    const SizedBox(height: 10.0),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(5.0),
                      color: Colors.grey.shade100,
                      child: Column(
                        children: [
                          Text(
                            widget.articleData['title'],
                            style: GoogleFonts.dmSans(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                          if (widget.articleData['description'] != null) ...[
                            const SizedBox(height: 10.0),
                            Text(
                              widget.articleData['description'],
                              style: GoogleFonts.dmSans(
                                fontSize: 18.0,
                              ),
                            ),
                          ],
                          if (widget.articleData['content'] != null) ...[
                            const SizedBox(height: 10.0),
                            Text(
                              widget.articleData['content'],
                              style: GoogleFonts.dmSans(
                                fontSize: 18.0,
                              ),
                            ),
                          ]
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ));
  }
}
