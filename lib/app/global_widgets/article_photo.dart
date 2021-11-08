import 'package:flutter/material.dart';

Widget articlePhoto(urlToImage, context) {
  return urlToImage == null
      ? Image.asset("assets/images/no-image.jpg", fit: BoxFit.cover, width: MediaQuery.of(context).size.width *0.95,)
      : Image.network(urlToImage.toString());
}
