import 'package:dio/dio.dart';
import 'package:newapp/http_constants/http_constants.dart';
import 'package:newapp/models/post_model.dart';

class PostRepository {
  Api002 api002 = Api002();

  Future <List<PostModels>> fetchPosts() async {
    try {
      Response response = await api002.sendRequest.get("/posts");
      List<dynamic> postMap = response.data;
      return postMap.map((postMap) => PostModels.fromJson(postMap)).toList();
    } catch (ex) {
      throw ex;
    }
  }
}
