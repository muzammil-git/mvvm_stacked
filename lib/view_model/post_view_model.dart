import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:mvvm_stacked/data/remote/network_api_service.dart';

import '../model/post_model.dart';

class PostViewModel with ChangeNotifier {

  Future<List<Post>> getPostData() async {
    try {
      List<dynamic> data = await NetworkApiService().getResponse("/posts");
      List<Post> postData = data.map((e) => Post.fromJson(e)).toList();
      // print(postData);
      return postData;
    } catch (e) {
      print(e);
      return [];
    }
  }

}
