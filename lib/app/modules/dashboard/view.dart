import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_flutter/app/modules/bookmarks/view.dart';
import 'package:news_app_flutter/app/modules/dashboard/controller.dart';
import 'package:news_app_flutter/app/modules/home/view.dart';
import 'package:news_app_flutter/app/modules/news/view.dart';
import 'package:news_app_flutter/app/modules/profile/view.dart';

class Dashboard extends StatelessWidget {
  Dashboard({Key? key}) : super(key: key);
  final controller = Get.find<DashboardController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) {
        return Scaffold(
          body: IndexedStack(
            index: controller.tabIndex,
            children: [
          HomeScreen(),
          NewsScreen(),
          BookmarksScreen(),
          const ProfileScreen()
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.red[700],
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            items: [
              _bottomNavigationBarItem(
                icon: Icons.home, label: 'Home'),
                _bottomNavigationBarItem(
                icon: Icons.wysiwyg, label: 'News'),
                _bottomNavigationBarItem(
                icon: Icons.bookmark, label: 'Bookmarks'),
                _bottomNavigationBarItem(
                icon: Icons.person_outline,label: 'Account'),
            ]),
        );
      },
    );
  }
  _bottomNavigationBarItem({required IconData icon,required String label}){
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label
       );

  }
}
