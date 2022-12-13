import 'package:flutter/cupertino.dart';
import 'package:newapp/models/post_model.dart';

class PostClass extends StatelessWidget {
  const PostClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center();
  }
}

abstract class PostState{}

class PostLoadingState {}

class PostLoadedState {
  List<PostModels> posts;
  PostLoadedState(this.posts);
}

class PostErrorState {
  String error;
  PostErrorState (this.error);
}