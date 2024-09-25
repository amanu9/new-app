

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/view/widget/home_widget.dart';
import '../../controller/news_controller.dart';
import '../widget/category_widget.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final controller= Get.put(NewsController());// DEPENDENCY INJECTION
  final pagecontroller=PageController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await Get.dialog(
          AlertDialog(
            title: const Text("Close the App"),
            content: const Text("Are you sure you want to close?"),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Get.back(result: true);
                },
                child: const Text(
                  "Close",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text(
                  "Cancel",
                  style: TextStyle(color: Colors.red),
                ),
              )
            ],
          ),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("News App"),
          centerTitle: true,
          actions: [
            GetBuilder<NewsController>( // Rebuild based on theme change
              builder: (controller) {
                return IconButton(
                  onPressed: () {
                    controller.changeThemeMode();
                  },
                  icon: Icon(controller.iconTheme()), // Updates icon based on theme
                );
              },
            ),
          ],
        ),

        body: PageView(
          onPageChanged: (index){
            controller.changeNavBar(currentindex: index);
           
          },
          controller: pagecontroller,
          children: [
            HomeWidget(),
            CategoryWidget()
          ],
        ),
        bottomNavigationBar: GetBuilder<NewsController>(
           builder: (controller) {
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: controller.index,
            onTap: (index) {
              controller.changeNavBar(currentindex: index);// select the selected bottom navigation item based on index
               pagecontroller.jumpToPage(index);// to navigate within the page
            },
            items:const [
              
            BottomNavigationBarItem(icon: Icon(Icons.home_max_outlined),
            label: "Home",
            tooltip: "Home",
            activeIcon: Icon(Icons.home)
            ),
               BottomNavigationBarItem(icon: Icon(Icons.category_outlined),
            label: "Category",
            activeIcon: Icon(Icons.category)
            ),
          ]);
           },
        )
      
        ,
      ),
    );
  }
}
