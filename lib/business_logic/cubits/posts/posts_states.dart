import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../data/models/posts_models.dart';
import '../../custom_states.dart';

class PostsState extends Equatable {
  final CustomAppStates? state;
  final List<PostData>? postsData;
  final PostData? postData;
  final String? errorMessage;

  const PostsState({
    @required this.state,
    @required this.postsData,
    @required this.postData,
    @required this.errorMessage,
  });

  PostsState copyWith({
    CustomAppStates? state,
    List<PostData>? postsData,
    PostData? postData,
    String? errorMessage,
  }) {
    return PostsState(
      state: state ?? this.state,
      postsData: postsData ?? this.postsData,
      postData: postData ?? this.postData,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        state,
        postsData,
        postData,
        errorMessage,
      ];
}
