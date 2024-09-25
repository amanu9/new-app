import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:news_app/controller/news_controller.dart';
import 'package:news_app/model/news_modal.dart';

import '../../shared/constant.dart';
import 'list_itemwidget.dart';

class CategoryWidget extends StatefulWidget {
  CategoryWidget({super.key});

  @override
  _CategoryWidgetState createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> with SingleTickerProviderStateMixin {
  late TabController controller;

  final newsController=Get.put(NewsController());// getting opject from news controller dependency injection

  @override
  void initState() {
    super.initState();
    controller = TabController(
      length: categoryList.categoryItem.length, // Using the category length
      vsync: this, // Use vsync with SingleTickerProviderStateMixin
    );
  }

  @override
  void dispose() {
    controller.dispose(); // Dispose controller to prevent memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          labelColor: Colors.blue,
          labelStyle: const TextStyle(fontSize: 20),
          isScrollable: true,
          controller: controller, // Assign the TabController here
          tabs: categoryList.categoryItem
              .map((category) => Tab(text: category))
              .toList(),
        ),
        Expanded(
          child: TabBarView(
            controller: controller,
            children: categoryList.categoryItem
                .map((category) {
                  return FutureBuilder(
                    future: newsController.getCategory(category: category),
                   builder: (context,Snapshot){
                    if(Snapshot.hasData){
                    return ListItemwidget(list: Snapshot.data as List<NewsModal>)  ;
                    }else{
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                   });

                }
                  )
                .toList(),
          ),
        ),
      ],
    );
  }
}
