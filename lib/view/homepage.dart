import 'package:flutter/material.dart';
import 'package:mvvm_stacked/view_model/post_view_model.dart';

import '../data/remote/network_api_service.dart';
import '../model/post_model.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post> posts = [];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () async {
                  posts =  await PostViewModel().getPostData();
                  print("sadasdasdasdasda  $posts");
                },
                child: Text("Get Post"),
            ),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: posts.length,
                padding: EdgeInsets.all(10),
                itemBuilder: (context, index) {
                  Post post = posts[index];
                  print(post);
                  return Material(
                    color: Colors.blue,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(post.title.toString(), style: TextStyle(fontWeight: FontWeight.bold),),
                        subtitle: Text(post.body.toString()),
                        tileColor: Colors.white,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
