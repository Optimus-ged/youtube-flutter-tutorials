import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:landing_and_login_screen/business_logic/app_state.dart';
import 'package:landing_and_login_screen/data/models/post_data_model.dart';

class UpdatePostDataState extends Equatable {
  final AppState? state;
  final PostDataModel? data;
  final String? errorMsg;

  const UpdatePostDataState({
    @required this.state,
    @required this.data,
    @required this.errorMsg,
  });

  UpdatePostDataState copyWith({
    AppState? state,
    PostDataModel? data,
    String? errorMsg,
  }) {
    return UpdatePostDataState(
        state: state ?? this.state,
        data: data ?? this.data,
        errorMsg: errorMsg ?? this.errorMsg);
  }

  @override
  List<Object?> get props => [state, data, errorMsg];
}
