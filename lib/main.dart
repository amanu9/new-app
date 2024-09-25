import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:news_app/view/screens/home.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();// ensure every thing is work before app run
  await GetStorage.init();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  final amanbox=GetStorage();// TO STORE ON LOCAL 
  @override
  Widget build(BuildContext context) {
    debugPrint(amanbox.read("theme"));
    return  GetMaterialApp(
      title: 'News',
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: amanbox.read("theme" )==null || amanbox.read("theme")!="dark"  ? ThemeMode.light:ThemeMode.dark,
     debugShowCheckedModeBanner: false,

      home: Home(),
    );
  }
}
