import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/news_controller.dart';

import 'list_itemwidget.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsController>(
      init:NewsController(),
      builder: (controller) {
        
        return ListItemwidget(list:controller.list
          
        );
      },

    );
  }
}