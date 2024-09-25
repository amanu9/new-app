import 'dart:convert';

class NewsModal{

  String? name,author,description,url,urlToImage,publishedAt,content,title;


  NewsModal({
    required this.name,
    required this.author,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
    required this.title
  });
  factory NewsModal.fromJson(Map<String ,dynamic>json){
    return NewsModal(
      name: json["source"]['name'], 
    author: json['author'], 
    description:json['description'], 
     url:json['url'], 
     title:json['title'],
      urlToImage:json['urlToImage']??"https://newsapi.org/v2/top-headlines?country=us&category=sports&apiKey=a9c0b03781794dfe911fa77e728ceb1a", 
     publishedAt:json['publishedAt'], 
     content:json['content']
    );

  }
}