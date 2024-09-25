import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:news_app/model/news_modal.dart';
import 'package:news_app/shared/constant.dart';

import 'api_helper.dart';

class NewsController extends GetxController{

final box=GetStorage();// to store on the local 

  // to change app  theme color
  void changeThemeMode(){

    String? theme= box.read("theme");
    if(theme==null || theme=="dark"){
        Get.changeThemeMode(ThemeMode.light);
        box.write("theme", "light");// then write to the memory

    }else{
    Get.changeThemeMode(ThemeMode.dark);
    box.write("theme", "dark");
   
    }
    update();
  }


  // to change the icon based on theme mode

  IconData iconTheme(){

 String? theme= box.read("theme");
 if(theme== "dark"){
  return Icons.dark_mode;
 }else{
  return Icons.light_mode;
 }

  }

// navbar index changing

int index=0;
void changeNavBar({required int currentindex}){
  index=currentindex;
  update();

}
List<NewsModal> list=[];// creating empty list
ApiService apiservice=ApiService();// getting object from my api helper to use it here

void getHeadlines()async{
list=  await apiservice.getHeadlines();
  update();
}

// getting news by category
List<NewsModal> categorylist=[];// creating empty category list
Future<List<NewsModal>> getCategory({required String category})async{
categorylist=  await apiservice.getNewsCategory(category: category);
return categorylist;
  
}

@override
  void onInit() {// to test it on init state if our api work or not
    getHeadlines();
    super.onInit();
  }
}