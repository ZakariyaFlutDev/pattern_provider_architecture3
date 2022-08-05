import 'package:flutter/material.dart';

import '../model/post_model.dart';
import '../pages/update_post.dart';
import '../service/http_service.dart';

class HomeViewModel extends ChangeNotifier{
  bool isLoading = false;
  List<Post> items = [];

  Future apiPostList() async {
    isLoading = true;
    notifyListeners();

    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    if (response != null) {
      items = Network.parsePostList(response);
    } else {
      items = [];
    }
    isLoading = false;
    notifyListeners();
  }

  Future<bool> apiPostDelete(Post post) async {
    isLoading = true;
    notifyListeners();

    var response = await Network.DEL(
        Network.API_DELETE + post.id.toString(), Network.paramsEmpty());

    if (response != null) {
    }
    isLoading = false;
    notifyListeners();

    return response != null;
  }

  void apiPostUpdate(Post post, BuildContext context){
    Navigator.of(context)
        .push( MaterialPageRoute(builder: (BuildContext context) {
      return UpdatePost(post: post);
    }));
  }

}