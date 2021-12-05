// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_flutter/app/modules/home/controller.dart';
final homeController = Get.find<HomeController>();
weatherCard(){
  return Visibility(
              // visible: homeController.isVisible,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: Offset(2, 2),
                          blurRadius: 10.0,
                          spreadRadius: 0),
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: Offset(-3, -3),
                          blurRadius: 10.0,
                          spreadRadius: 0),
                    ]),
                margin: const EdgeInsets.all(20.5),
                height: 100.0,
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 35.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              child: Icon(
                            Icons.cloud,
                            size: 40.0,
                            color: Colors.grey[600],
                          )),
                          IconButton(icon: Icon(Icons.close_rounded), onPressed: null,),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                                  children: [
                                     
                                    Text(
                                      '12 \u00B0 Cloudy',
                                      style: TextStyle(
                                          fontSize: 25.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text('It could be rain',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Mosmiyat, Karachi',
                                          style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                                        ),
                                        Icon(Icons.room_outlined)
                                      ],
                                    ),
                                    Text(
                                      'Sunday, 10.:40 AM',
                                      style: TextStyle(color: Colors.grey[600]),
                                    )
                                  ],
                                ), 
              
                          
                        ],
                      ),
                    ),
                  ],
                ),
              ),
  );
}