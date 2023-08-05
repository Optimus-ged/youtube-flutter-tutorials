

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:landing_and_login_screen/data/models/posts_models.dart';

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
            postData: null,
          ),
        );

  // get data
  void fetch() async {
    try {
      emit(state.copyWith(state: CustomAppStates.loading));
      final result = await PostsRepositories.getPosts();
      if (result.isNotEmpty) {
        await Future.delayed(
          const Duration(seconds: 3),
        );
        emit(
          state.copyWith(
            state: CustomAppStates.success,
            postsData: result,
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
    }
  }

  // create post
  void create(PostData data) async {
    try {
      emit(state.copyWith(state: CustomAppStates.loading));
      final result = await PostsRepositories.createPosts(data);
      if (result.id != null) {
        await Future.delayed(
          const Duration(seconds: 3),
        );
        emit(
          state.copyWith(
            state: CustomAppStates.success,
            postData: result,
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
    }
  }
}
