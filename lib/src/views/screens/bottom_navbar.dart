import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/core/theme/colors.dart';
import 'package:travel_app/src/views/screens/bar_item_page.dart';
import 'package:travel_app/src/views/screens/home_page.dart';
import 'package:travel_app/src/views/screens/my_page.dart';
import 'package:travel_app/src/views/screens/search_page.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    RxInt currentIndex = 0.obs;
    List pages = [HomePage(), BarItemPage(), SearchPage(), MyPage()];
    void onTap(int index) {
      currentIndex.value = index;
    }

    return Obx(
      () => Scaffold(
        body: pages[currentIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex.value,
          onTap: onTap,
          selectedItemColor: AppColors.mainColor,
          unselectedItemColor: AppColors.mainColor.withOpacity(0.1),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(label: "Home", icon: Icon(Icons.apps)),
            BottomNavigationBarItem(label: "Home", icon: Icon(Icons.apps)),
            BottomNavigationBarItem(label: "Search", icon: Icon(Icons.search)),
            BottomNavigationBarItem(label: "Person", icon: Icon(Icons.person)),
          ],
        ),
      ),
    );
  }
}
