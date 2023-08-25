abstract class PostStates{}

class PostInitialState extends PostStates{}
class PostChangeColorButtonState extends PostStates{}

class AddPostLoadingState extends PostStates{}
class AddPostSuccessState extends PostStates{}
class AddPostErrorState extends PostStates {
  final String error;

  AddPostErrorState(this.error);
}
class AddPhotoPostSuccessState extends PostStates{}
class AddPhotoPostErrorState extends PostStates{
}
