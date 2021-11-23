import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with SingleGetTickerProviderMixin{
  final List<Tab> tabs = const <Tab>[
      Tab(text: 'Politics',),
      Tab(text: 'Science',),
      Tab(text: 'Sports',),
      Tab(text: 'Health',), 
      Tab(text: 'Fashion',),
      Tab(text: 'Sports',),
      Tab(text: 'Health',), 
      Tab(text: 'Fashion',),
  ];
  late TabController controller;
  bool isVisible = true;
  toggleCard(){
    isVisible = !isVisible;
    update();
  }

  @override
  void onInit(){
    super.onInit();
    controller = TabController(length: tabs.length, vsync: this);

  }
  @override onClose(){
    controller.dispose();
    super.onClose(); 
  }
}