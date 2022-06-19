import 'package:flutter/material.dart';
import 'package:news/controls/asset_paths.dart';
import 'package:news/screens/detail_page.dart';

class NewsImage extends StatelessWidget {
  const NewsImage({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String? imageUrl;

  String getImageUrl(dynamic url) {
    if (url != null) {
      return url;
    } else {
      return AssetPaths.dummyImage;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      child: Image.network(
        getImageUrl(imageUrl),
        width: double.maxFinite,
        fit: BoxFit.cover,
      ),
    );
  }
}
