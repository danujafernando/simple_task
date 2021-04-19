import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:simple_task/models/post_model.dart';

class PostApi{
  final String _endPoint = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<PostModel>> getAllPost() async{
    final response = await http.get(_endPoint);
    List<PostModel> postList = [];
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      for(var i in jsonData){
        postList.add(PostModel.fromJson(i));
      }
      return postList;
    } else {
      return postList;
    }
  }
}