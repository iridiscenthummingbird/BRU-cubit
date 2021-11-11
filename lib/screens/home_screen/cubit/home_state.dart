part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomePostsWait extends HomeState {}

class HomeGetPosts extends HomeState {
  final List<Post> _list;

  HomeGetPosts(this._list);

  List<Post> get list => _list;
}
