import 'package:flutter/material.dart';
import 'package:news/controls/asset_paths.dart';
import 'package:news/network_constants.dart';

class NewsImage extends StatelessWidget {
  final String? imageUrl;
  final dynamic keywords;
  final dynamic category;

  const NewsImage({
    Key? key,
    required this.imageUrl,
    this.keywords,
    this.category,
  }) : super(key: key);

  String getImageUrl(dynamic url) {
    String toReturn = AssetPaths.dummyImage;
    late String keyWord;
    if (url != null) {
      return url;
    } else {
      List? item = keywords ?? category;
      if (item != null) {
        keyWord = item[0];
        return NetworkConstant.randomImage + keyWord;
      }
      return toReturn;
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
