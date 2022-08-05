import 'package:flutter/material.dart';

import '../model/post_model.dart';
import '../pages/home_page.dart';
import '../service/http_service.dart';

class CreateViewModel extends ChangeNotifier{

  bool isLoading = false;

  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

   Future apiCreatePost(BuildContext context) async{
    isLoading = true;
    notifyListeners();

    String title = titleController.text.toString().trim();
    String content = contentController.text.toString().trim();

    Post post =  Post(id: 101, title: title, body: content, userId: 101);

    var response = await Network.POST(Network.API_CREATE, Network.paramsCreate(post));

    if(response !=null){
      Navigator.pushNamed(context, HomePage.id);
    }else{
      return;
    }
    isLoading = false;
    notifyListeners();


  }

}