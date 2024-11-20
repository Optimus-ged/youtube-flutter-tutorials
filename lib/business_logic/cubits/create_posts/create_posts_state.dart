import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:landing_and_login_screen/business_logic/app_state.dart';
import 'package:landing_and_login_screen/data/models/post_data_model.dart';

class CreatePostDataState extends Equatable {
  final AppState? state;
  final PostDataModel? data;
  final String? errorMsg;

  const CreatePostDataState({
    @required this.state,
    @required this.data,
    @required this.errorMsg,
  });

  CreatePostDataState copyWith({
    AppState? state,
    PostDataModel? data,
    String? errorMsg,
  }) {
    return CreatePostDataState(
        state: state ?? this.state,
        data: data ?? this.data,
        errorMsg: errorMsg ?? this.errorMsg);
  }

  @override
  List<Object?> get props => [state, data, errorMsg];
}
