import "package:flutter/material.dart";

class DetailsPage extends StatefulWidget {
  final String title;
  final String imageUrl;
  final String description;
  final String? content;

  const DetailsPage({
    required this.title,
    required this.description,
    required this.imageUrl,
    this.content,
    Key? key,
  }) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 150,
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0)),
                      child: Image.network(widget.imageUrl),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    widget.title,
                    style: const TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10.0),
                  Text(widget.description),
                  if (widget.content != null) const SizedBox(height: 10.0),
                  Text(widget.content!),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
