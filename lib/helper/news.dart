import 'dart:convert';

import 'package:flutter_news_app/models/article_model.dart';
import 'package:http/http.dart' as http;
class News{

  List<ArticleModel> news = [];

 Future<void> getNews()async{
   String url="https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=5a25e108dbc44b8fbb6fbdd3333ded59";
   var response= await http.get(url);
   var jsonData= jsonDecode(response.body);
   if(jsonData['status']=="ok"){
     jsonData["articles"].forEach((element){

       if(element["urlToImage"] != null && element['description']!=null){

         ArticleModel articleModel = ArticleModel(
           title: element['title'],
           author: element["author"],
           description: element["description"],
           url: element["url"],
           urlImage: element["urlToImage"],
           content: element["content"],
         );
         news.add(articleModel);
       }

     });
   }
 }
}

class CategoryNewsClass{

  List<ArticleModel> news = [];

  Future<void> getNews(String category)async{
    String url="https://newsapi.org/v2/top-headlines?category=$category&country=us&category=business&apiKey=5a25e108dbc44b8fbb6fbdd3333ded59";
    var response= await http.get(url);
    var jsonData= jsonDecode(response.body);
    if(jsonData['status']=="ok"){
      jsonData["articles"].forEach((element){

        if(element["urlToImage"] != null && element['description']!=null){

          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element["author"],
            description: element["description"],
            url: element["url"],
            urlImage: element["urlToImage"],
            content: element["content"],
          );
          news.add(articleModel);
        }

      });
    }
  }
}