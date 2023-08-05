import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../data/repositories/posts_repositories.dart';
import '../../custom_states.dart';
import 'posts_states.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit()
      : super(
          const PostsState(
            state: CustomAppStates.initial,
            postsData: [],
            errorMessage: "",
          ),
        );

  // get data
  void getPosts() async {
    try {
      emit(state.copyWith(state: CustomAppStates.loading));
      final postsData = await PostsRepositories.getPostsdData();
      if (postsData.isNotEmpty) {
        await Future.delayed(
          const Duration(seconds: 3),
        );
        emit(
          state.copyWith(
            state: CustomAppStates.success,
            postsData: postsData,
          ),
        );
      }
    } catch (error, stacktrace) {
      debugPrint('Main.Main ::: ERROR: $error & STACKTRACE: $stacktrace');

      emit(
        state.copyWith(
          state: CustomAppStates.error,
          errorMessage: "Server error",
        ),
      );
      // print("$e");
    }
  }
}
