import 'package:simple_task/models/post_model.dart';
import 'package:simple_task/services/post_api.dart';

class PostRepository{
  PostApi _postApi = PostApi();

  Future<List<PostModel>> getAllPost(){
    return _postApi.getAllPost();
  }
}