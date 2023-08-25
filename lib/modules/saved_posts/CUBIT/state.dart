import 'package:san3a/models/saved_posts_model.dart';

abstract class SavedPostsState{}

class SavedPostsPostState extends SavedPostsState{}

class SavedPostsLoadingState extends SavedPostsState{}
class SavedPostsSuccessState extends SavedPostsState{
  SavedPostsModel? getPost;
  SavedPostsSuccessState(this.getPost);
}
class SavedPostsErrorState extends SavedPostsState{
  final String error;
  SavedPostsErrorState(this.error);
}