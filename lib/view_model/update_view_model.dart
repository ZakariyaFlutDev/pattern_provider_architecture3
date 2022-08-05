import 'package:flutter/material.dart';

import '../model/post_model.dart';
import '../pages/home_page.dart';
import '../service/http_service.dart';

class UpdateViewModel extends ChangeNotifier{
  bool isLoading = false;

  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  Future apiUpdatePost(Post post, BuildContext context) async {
    isLoading = true;
    notifyListeners();

    String title = titleController.text.toString().trim();
    String content = contentController.text.toString().trim();

    post.title = title;
    post.body = content;

    var response = await Network.PUT(
        Network.API_UPDATE + post.id.toString(),
        Network.paramsUpdate(post));

    if (response != null) {
      Navigator.pushReplacementNamed(context, HomePage.id);
    } else {
      return;
    }
    isLoading = false;

    print(post.title);
  }
}