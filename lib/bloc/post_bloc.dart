import 'package:rxdart/rxdart.dart';
import 'package:simple_task/models/post_model.dart';
import 'package:simple_task/repositories/post_repository.dart';

class PostBloc{

  final PostRepository _repository = PostRepository();
  final BehaviorSubject<List<PostModel>> _subject =
      BehaviorSubject<List<PostModel>>();

  getPosts() async {
     List<PostModel> response = await _repository.getAllPost();
     print(response);
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<List<PostModel>> get subject => _subject;    
}

final post_bloc = PostBloc();