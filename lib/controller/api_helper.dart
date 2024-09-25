import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';

import '../model/news_modal.dart';

class ApiService extends GetConnect implements GetxService{

// getting top headlines news
  Future<List<NewsModal>> getHeadlines()async{

    Response response=await get("https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=a9c0b03781794dfe911fa77e728ceb1a");
 List data =response.body['articles'];
 
List<NewsModal> newsModel=data.map((e)=>NewsModal.fromJson(e)).toList();
return newsModel;
  }

  // GETTING NEWS BY CATEGORY
    Future<List<NewsModal>> getNewsCategory({required String category})async{

    Response response=await get("https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=a9c0b03781794dfe911fa77e728ceb1a");
 List data =response.body['articles'];
 
List<NewsModal> newsModel=data.map((e)=>NewsModal.fromJson(e)).toList();
return newsModel;
  }
}