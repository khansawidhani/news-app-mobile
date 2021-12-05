// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_flutter/app/modules/home/category_controller.dart';
import 'package:news_app_flutter/app/modules/home/category_news.dart';
import 'package:news_app_flutter/app/modules/home/controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
final homeController = Get.find<HomeController>();
final categoryController = Get.find<Controller>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        title: const Text(
          'NEWS',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 30,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_outlined,
                size: 30.0,
              )),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(55.0),
          child: TabBar(
            controller: homeController.controller,
            tabs: homeController.tabs,
            labelColor: Colors.black87,
            indicatorSize: TabBarIndicatorSize.label,
            isScrollable: true,
          ),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(child: Container()),
            ListTile(
              title: Text('Logout'),
              leading: Icon(
                Icons.logout_outlined,
                color: Colors.red[600],
              ),
            )
          ],
        ),
      ),
      body:    
      TabBarView(
            controller: homeController.controller,
            // children: controller.category.map((element) => controller.theNews(context, element)).toList()
            children: [
              FutureBuild(method: categoryController.getNewsByGeneralCategory()),
              FutureBuild(method: categoryController.getNewsByScienceCategory()), 
              FutureBuild(method: categoryController.getNewsBySportsCategory()),
              FutureBuild(method: categoryController.getNewsByTechnologyCategory()),
              FutureBuild(method: categoryController.getNewsByHealthCategory()),
              FutureBuild(method: categoryController.getNewsByFashionCategory()),
              FutureBuild(method: categoryController.getNewsByEntertainmentCategory()),
            ]
          ));
  }
}