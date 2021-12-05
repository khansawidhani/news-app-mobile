import 'package:flutter/material.dart';

Widget articlePhoto(String? urlToImage, context) {
  // print("Article photo : $urlToImage");
  return urlToImage == null
      ? Image.asset("assets/images/no-image.jpg", fit: BoxFit.cover, width: MediaQuery.of(context).size.width *0.95,)
      : Image.network(urlToImage.toString(), fit: BoxFit.cover,);
}
