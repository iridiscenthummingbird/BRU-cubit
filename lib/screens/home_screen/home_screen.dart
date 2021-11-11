import 'dart:async';

import 'package:bru/models/post.dart';
import 'package:bru/repository/posts_repository.dart';
import 'package:bru/screens/home_screen/cubit/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeCubit _cubit;

  late StreamController<List<Post>> _controller;

  @override
  void initState() {
    _cubit = HomeCubit(postsRepository: context.read<IPostsRepository>());
    _controller = StreamController<List<Post>>();
    _cubit.getPosts();
    _cubit.stream.listen(
      (state) {
        if (state is HomeGetPosts) {
          _controller.add(state.list);
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xFF353535),
          body: BlocBuilder(
            bloc: _cubit,
            builder: (context, state) {
              if (state is HomePostsWait) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return StreamBuilder<List<Post>>(
                  stream: _controller.stream,
                  initialData: const [],
                  builder: (context, snapshot) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final post = snapshot.data![index];
                        return Center(
                          child: ListTile(
                            leading: Text(
                              post.id.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            title: Text(
                              post.title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            subtitle: Text(
                              post.body,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            isThreeLine: true,
                          ),
                        );
                      },
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
