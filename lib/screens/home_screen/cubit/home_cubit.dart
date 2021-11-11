import 'package:bloc/bloc.dart';
import 'package:bru/models/post.dart';
import 'package:bru/repository/posts_repository.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.postsRepository}) : super(HomeInitial());

  final IPostsRepository postsRepository;

  Future<void> getPosts() async {
    emit(HomePostsWait());
    emit(HomeGetPosts(await postsRepository.getPosts()));
    emit(HomeInitial());
  }
}
