import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newapp/logic/cubit/post_state.dart';
import 'package:newapp/services/post_services.dart';

class PostCubit extends Cubit <PostState> {
  PostCubit (): super (_buildPostLoading(),);

  PostRepository postRepository = PostRepository();




  _buildPostError(){
    return PostErrorState;
  }
}

_buildPostLoading(){
  return PostLoadingState();
}

_buildPostLoaded(){
  return PostLoadedState;
}