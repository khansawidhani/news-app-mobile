import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_flutter/app/data/model/article.dart';
import 'package:news_app_flutter/app/data/repository/news_repo.dart';
import 'package:news_app_flutter/app/modules/home/category_controller.dart';

class HomeController extends GetxController with SingleGetTickerProviderMixin{
  NewsRepository? newsRepo;
  Controller? categoryController;

  // Tabs controller
  final List<Tab> tabs = const <Tab>[
      Tab(text: 'General',),
      Tab(text: 'Science',),
      Tab(text: 'Sports',),
      Tab(text: 'Technology',), 
      Tab(text: 'Health',), 
      Tab(text: 'Fashion',),
      Tab(text: 'Entertainment',),

  ];
  late TabController controller;
  
  
  @override
  void onInit(){
    super.onInit();
    controller = TabController(length: tabs.length, vsync: this);
    categoryController = Get.find<Controller>();

    // newsRepo = Get.find<NewsRepository>();
    
    // articlesListIterate(tabs);

  }
  @override onClose(){
    controller.dispose();
    super.onClose(); 
  }
  
  RxBool isLoading = false.obs;
  showLoading()=> isLoading.toggle();
  hideLoading() => isLoading.toggle();

Widget ListShow () => ListView.builder(
  itemBuilder: (context, index){
    return Container(
      child: Text('hello'),
    );
  }
);
Widget buildFuture (ft) => FutureBuilder<List<Article>>(
         future: ft,
         builder: (context,AsyncSnapshot<List<Article>> snapshot){
           if(snapshot.hasData){
           print(snapshot.data?.length);
           return ListView.builder(
             itemCount: snapshot.data!.length,
             itemBuilder: (context, index){
               return Text(snapshot.data![index].title);
             });

           }
           if(snapshot.hasError){
             print(snapshot.error);
           }
           return const Center(child: CircularProgressIndicator());
         }
         );



}