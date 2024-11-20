import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:landing_and_login_screen/business_logic/app_state.dart';
import 'package:landing_and_login_screen/business_logic/cubits/post_data/posts_data_state.dart';
import 'package:landing_and_login_screen/business_logic/cubits/update_post/updates_post_state.dart';
import 'package:landing_and_login_screen/data/models/post_data_model.dart';
import 'package:landing_and_login_screen/data/repositories/post_data_repositories.dart';

class UpdatePostsDataCubit extends Cubit<UpdatePostDataState> {
  UpdatePostsDataCubit()
      : super(
          const UpdatePostDataState(
            state: AppState.initial,
            data: null,
            errorMsg: "",
          ),
        );

  void update(PostDataModel data) async {
    try {
      emit(
        state.copyWith(state: AppState.loading),
      );
      final result = await PostsDataRepositories.updatePosts(data);
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
