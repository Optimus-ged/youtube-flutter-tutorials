import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:landing_and_login_screen/business_logic/app_state.dart';
import 'package:landing_and_login_screen/business_logic/cubits/create_posts/create_posts_state.dart';
import 'package:landing_and_login_screen/data/models/post_data_model.dart';
import 'package:landing_and_login_screen/data/repositories/post_data_repositories.dart';

class CreatePostsDataCubit extends Cubit<CreatePostDataState> {
  CreatePostsDataCubit()
      : super(
          CreatePostDataState(
            state: AppState.initial,
            data: PostDataModel(),
            errorMsg: "",
          ),
        );

  void createPosts(PostDataModel data) async {
    try {
      emit(
        state.copyWith(state: AppState.loading),
      );
      final result = await PostsDataRepositories.createPosts(data);

      emit(
        state.copyWith(
          state: AppState.success,
          data: result,
        ),
      );
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
