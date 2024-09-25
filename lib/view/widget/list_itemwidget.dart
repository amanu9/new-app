import 'package:flutter/material.dart';
import 'package:news_app/model/news_modal.dart';
class ListItemwidget extends StatelessWidget {
  const  ListItemwidget({super.key,  required this.list});
  
 final List<NewsModal>list;// to access or  use our news modal
  @override
  Widget build(BuildContext context) {
    if(list.isNotEmpty){
      return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context,index){
        return Container(
          margin: EdgeInsets.all(10),
         // color: Colors.teal,
          height:MediaQuery.of(context).size.height*0.3,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(20),
            image:  DecorationImage(
              image: NetworkImage("${list[index].urlToImage}"),
            fit: BoxFit.cover)
         
          ),
             alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.5),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)
              )

            ),
            padding: EdgeInsets.all(10),
            child: Text("${list[index].title}",style: const TextStyle(color: Colors.white),
            textAlign: TextAlign.center,),
          ),
        );
      },



    );
    }else{
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}