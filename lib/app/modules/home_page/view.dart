import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_flutter/app/data/model/article.dart';
import 'package:news_app_flutter/app/modules/home_page/controller.dart';
import 'package:news_app_flutter/app/modules/user_auth/controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    print("getting into Home page");
    print(homeController.articles.runtimeType);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('The News'),
          centerTitle: true,
          backgroundColor: Colors.red[800],
        ),
        body: Obx(() {
          return homeController.isLoading.isTrue
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        Text(homeController.articles![0].title.toString()),
                        Text(homeController.articles![0].author.toString())
                      ],
                    ),
                  );
                });

          // Column(
          //           children: [
          //             Text('1st row'),
          //             Expanded(
          //               child: ListView.builder(
          //                 itemCount: homeController.articles!.length,
          //                 physics: NeverScrollableScrollPhysics(),
          //                 shrinkWrap: true,
          //                 itemBuilder: (context, index) {
          //                 print(homeController.articles![index].urlToImage.toString());

          //                           return Card(
          //                             child: Column(
          //                               children: [
          //                                 // Image.network(homeController.articles![index].urlToImage.toString()

          //                                         // : )"assets/images/no-image.jpg"
          //                                 // )
          //                       ],
          //                     ),
          //                   );
          //                 }),
          //     ),
          //   ],
          // );
        }));
  }
}
