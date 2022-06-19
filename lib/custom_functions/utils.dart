import 'dart:math';

import '../controls/asset_paths.dart';

int randomPageNumber() {
  Random random = Random();
  int randomNumber = random.nextInt(10);
  return randomNumber;
}

String getImageUrl(dynamic url) {
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
