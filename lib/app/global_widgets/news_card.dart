import 'package:flutter/material.dart';
import 'package:news_app_flutter/app/global_widgets/article_photo.dart';
import 'package:news_app_flutter/app/global_widgets/text_utils.dart';
import 'package:news_app_flutter/app/global_widgets/utils.dart';

newsCard(BuildContext context, String? urlToImage, String? author, String title,
    String? description, String publishedAt) {
  return Card(
    child: Column(
      children: [
        Container(
            padding: const EdgeInsets.all(3.0),
            child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0)),
                child: articlePhoto(urlToImage, context))),
        Container(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              author != null ? author.toString() : "Anonymous ",
              style: authorTextStyle(),
            ),
            Text(
              title,
              style: headingTextStyle(),
            ),
            spacer(10.0),
            Text(
              description != null ? description.toString() : "Not Available",
              style: descriptionTextStyle(),
            ),
            // spacer(10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(publishedAt, style: publishedAtTextStyle(),),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_border,
                      color: Colors.red,
                      size: 20.0,
                    ))
              ],
            ),
            // spacer(10.0),
          ]),
        )
      ],
    ),
  );
}
