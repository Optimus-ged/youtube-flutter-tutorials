import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../data/models/posts_models.dart';
import '../../../data/repositories/posts_repositories.dart';
import '../../custom_states.dart';
import 'posts_states.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit()
      : super(
          const PostsState(
            state: CustomAppStates.initial,
            postsData: [],
            searchedPostsList: [],
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
            searchedPostsList: result,
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
        await Future.delayed(const Duration(seconds: 1));

        // add the posted data to the existinf list
        final updatedList = state.postsData!;
        updatedList.insert(0, result);

        // now we can emit a new state
        emit(
          state.copyWith(
            state: CustomAppStates.success,
            postData: result,
            postsData: updatedList,
            searchedPostsList: updatedList,
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

  void update(PostData data) async {
    try {
      emit(state.copyWith(state: CustomAppStates.loading));
      final result = await PostsRepositories.updatePosts(data);
      if (result.id != null) {
        await Future.delayed(const Duration(seconds: 1));

        // let's update the list by removing the previous data
        // by this new one
        final updatedList = state.postsData!;
        final index = updatedList.indexOf(
          updatedList.where((e) => e.id == result.id).first,
        );
        updatedList[index] = result;

        // now we can emit a new state
        emit(
          state.copyWith(
            state: CustomAppStates.success,
            postData: result,
            postsData: updatedList,
            searchedPostsList: updatedList,
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

  void delete(int id) async {
    try {
      emit(state.copyWith(state: CustomAppStates.loading));
      final result = await PostsRepositories.deletePost(id);

      await Future.delayed(const Duration(seconds: 1));

      // let's update the list by removing the previous data
      // by this new one
      final updatedList = state.postsData!;
      updatedList.removeWhere((e) => e.id == id);

      // now we can emit a new state
      emit(
        state.copyWith(
          state: CustomAppStates.success,
          postData: result,
          postsData: updatedList,
          searchedPostsList: updatedList,
        ),
      );
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

  void filterPosts(String value) {
    if (state.postsData!.isNotEmpty) {
      List<PostData> result = [];
      result = state.searchedPostsList!;
      if (value.isNotEmpty) {
        result = state.postsData!
            .where(
              (e) => e.title!.toLowerCase().contains(
                    value.toLowerCase(),
                  ),
            )
            .toList();
      }

      emit(
        state.copyWith(
          searchedPostsList: result,
        ),
      );
    }
  }
}
