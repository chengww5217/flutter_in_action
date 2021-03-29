import 'package:flutter/material.dart';

Widget loadingImage(String url, {
 double width = double.infinity, double height = 180
}) {
  return Image.network(url,
      width: width,
      height: height,
      fit: BoxFit.cover,
      errorBuilder: loadingImageError,
      loadingBuilder: loadingImageLoading);
}

Widget loadingImageLoading(BuildContext context, Widget child,
    ImageChunkEvent loadingProgress) {
  if (loadingProgress == null) return child;
  final loadingPercent = loadingProgress.expectedTotalBytes != null
      ? "${loadingProgress.cumulativeBytesLoaded * 100.0 /
      loadingProgress.expectedTotalBytes}%"
      : "";
  return _loadingBase(
      "Loading $loadingPercent");
}

Widget loadingImageError(BuildContext context, Object error,
    StackTrace stackTrace) {
  return _loadingBase("Load Image Error");
}

Widget _loadingBase(String message) =>
    Container(
      width: 500,
      height: 180,
      color: Colors.grey,
      child: Center(
        child: Text(
          message,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
