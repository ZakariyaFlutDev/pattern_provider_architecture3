import 'package:flutter/material.dart';
import 'package:pattern_provider_architecture3/model/post_model.dart';
import 'package:pattern_provider_architecture3/view_model/update_view_model.dart';
import 'package:provider/provider.dart';

class UpdatePost extends StatefulWidget {
  const UpdatePost({Key? key, required this.post}) : super(key: key);

  static const String id = "update_post";
  final Post post;

  @override
  State<UpdatePost> createState() => _UpdatePostState();
}

class _UpdatePostState extends State<UpdatePost> {

  UpdateViewModel viewModel = UpdateViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.titleController.text = widget.post.title!;
    viewModel.contentController.text = widget.post.body!;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Update Post",
            style: TextStyle(color: Colors.white, fontSize: 28),
          ),
        ),
        body: ChangeNotifierProvider(
          create: (context) => viewModel,
          child: Consumer<UpdateViewModel>(
            builder: (ctx,model,index) => Stack(
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
                                hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 16),
                                border: InputBorder.none),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: widget.post.body!.length < 50 ? 50 : 100,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey.shade300),
                          child: TextField(
                            maxLines: 20,
                            minLines: 2,
                            controller: viewModel.contentController,
                            decoration: InputDecoration(
                                hintText: "Content",
                                hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 16),
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
                                  viewModel.apiUpdatePost(widget.post,context);
                                },
                                child: Text(
                                  "Update Post",
                                  style: TextStyle(color: Colors.white, fontSize: 22),
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
            ),
          ),
        )
    );
  }
}
