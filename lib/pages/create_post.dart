import 'package:flutter/material.dart';
import 'package:pattern_provider_architecture3/model/post_model.dart';
import 'package:pattern_provider_architecture3/pages/home_page.dart';
import 'package:pattern_provider_architecture3/service/http_service.dart';
import 'package:pattern_provider_architecture3/view_model/create_view_model.dart';
import 'package:provider/provider.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({Key? key}) : super(key: key);

  static const String id = "create_post";

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  CreateViewModel viewModel = CreateViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Create Post",
            style: TextStyle(color: Colors.white, fontSize: 28),
          ),
        ),
        body: ChangeNotifierProvider(
            create: (context) => viewModel,
            child: Consumer<CreateViewModel>(
                builder: (ctx, model, index) => Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Center(
                            child: Column(
                              children: [
                                Container(
                                  height: 55,
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.grey.shade300),
                                  child: TextField(
                                    controller: viewModel.titleController,
                                    decoration: InputDecoration(
                                        hintText: "Title",
                                        hintStyle: TextStyle(
                                            color: Colors.grey, fontSize: 16),
                                        border: InputBorder.none),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: 55,
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.grey.shade300),
                                  child: TextField(
                                    controller: viewModel.contentController,
                                    decoration: InputDecoration(
                                        hintText: "Content",
                                        hintStyle: TextStyle(
                                            color: Colors.grey, fontSize: 16),
                                        border: InputBorder.none),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: 55,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.blue),
                                  child: Center(
                                      child: GestureDetector(
                                    onTap: () {
                                      viewModel.apiCreatePost(context);
                                    },
                                    child: Text(
                                      "Add Post",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 22),
                                    ),
                                  )),
                                ),
                              ],
                            ),
                          ),
                        ),
                        viewModel.isLoading
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : SizedBox.shrink(),
                      ],
                    ))));
  }
}
