import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_flutter/app/global_widgets/news_card.dart';
import 'package:news_app_flutter/app/modules/home/controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final homeController = Get.find<HomeController>();

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
      body: TabBarView(
        controller: homeController.controller,
        children: [
          SingleChildScrollView(
              child: Column(children: [
            const SizedBox(
              height: 20.0,
            ),
            Obx((){
              return homeController.isVisible == true ?
            Visibility(
              visible: homeController.isVisible,
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
                          IconButton(icon: Icon(Icons.close_rounded), onPressed: homeController.toggleCard(),),
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
            )
            : Container();
            })
          ])),
          Center(
            child: Text('Science'),
          ),
          Center(
            child: Text('Sports'),
          ),
          Center(
            child: Text('Health'),
          ),
          Center(
            child: Text('Fashion'),
          ),
          Center(
            child: Text('Sports'),
          ),
          Center(
            child: Text('Health'),
          ),
          Center(
            child: Text('Fashion'),
          ),
        ],
      ),
    );
  }
}
