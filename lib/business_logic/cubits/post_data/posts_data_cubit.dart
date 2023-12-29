import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:landing_and_login_screen/business_logic/app_state.dart';
import 'package:landing_and_login_screen/business_logic/cubits/post_data/posts_data_state.dart';
import 'package:landing_and_login_screen/data/models/post_data_model.dart';
import 'package:landing_and_login_screen/data/repositories/post_data_repositories.dart';

class PostsDataCubit extends Cubit<PostDataState> {
  PostsDataCubit()
      : super(
          const PostDataState(
            state: AppState.initial,
            data: <PostDataModel>[],
            errorMsg: "",
          ),
        );

  void load() async {
    try {
      emit(
        state.copyWith(state: AppState.loading),
      );
      final result = await PostsDataRepositories.getPosts();
      await Future.delayed(const Duration(seconds: 3));
      if (result.isNotEmpty) {
        emit(
          state.copyWith(
            state: AppState.success,
            data: result,
          ),
        );
      }
    } catch (error, stackTrace) {
      debugPrint("Error : $error && stacktrace $stackTrace ");
      emit(
        state.copyWith(
          state: AppState.error,
          errorMsg: "An error occured",
        ),
      );
    }
  }
}
