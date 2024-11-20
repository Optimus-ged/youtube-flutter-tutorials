import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:landing_and_login_screen/business_logic/app_state.dart';
import 'package:landing_and_login_screen/business_logic/cubits/create_posts/create_posts_cubit.dart';
import 'package:landing_and_login_screen/business_logic/cubits/create_posts/create_posts_state.dart';
import 'package:landing_and_login_screen/business_logic/cubits/post_data/posts_data_cubit.dart';
import 'package:landing_and_login_screen/business_logic/cubits/update_post/posts_data_cubit.dart';
import 'package:landing_and_login_screen/business_logic/cubits/update_post/updates_post_state.dart';
import 'package:landing_and_login_screen/data/models/post_data_model.dart';
import 'package:landing_and_login_screen/presentation/shared_widgets/custom_btn_widget.dart';

class EditPostsView extends StatefulWidget {
  final PostDataModel? data;
  const EditPostsView({super.key, this.data});

  @override
  State<EditPostsView> createState() => _EditPostsViewState();
}

class _EditPostsViewState extends State<EditPostsView> {
  final titleCtrl = TextEditingController();
  final bodyCtrl = TextEditingController();

  createPost() {
    final data = PostDataModel(
      title: titleCtrl.text.trim(),
      body: bodyCtrl.text.trim(),
      id: Random().nextInt(100) + 1,
      userId: Random().nextInt(100) + 1,
    );

    context.read<CreatePostsDataCubit>().createPosts(data);
  }

  updatePost() {
    final data = PostDataModel(
      title: titleCtrl.text.trim(),
      body: bodyCtrl.text.trim(),
      id: widget.data?.id,
      userId: Random().nextInt(100) + 1,
    );

    context.read<UpdatePostsDataCubit>().update(data);
  }

  fillData(PostDataModel data) {
    titleCtrl.text = "${data.title}";
    bodyCtrl.text = "${data.body}";
  }

  @override
  void initState() {
    if (widget.data != null) {
      fillData(widget.data!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<CreatePostsDataCubit, CreatePostDataState>(
          listener: (context, state) {
            if (state.state == AppState.success) {
              context.read<PostsDataCubit>().addPost(state.data!);
              Navigator.of(context).pop();
            }
          },
        ),
        BlocListener<UpdatePostsDataCubit, UpdatePostDataState>(
          listener: (context, state) {
            if (state.state == AppState.success) {
              context.read<PostsDataCubit>().updatePost(state.data!);
              Navigator.of(context)..pop()..pop();
            }
          },
        ),
      ],
      child: Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.close,
                  color: Colors.amber[800],
                ),
              ),
            ),
            body: Column(
              children: [
                // text form fields widget
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: titleCtrl,
                          cursorColor: Colors.amber,
                          style: const TextStyle(fontSize: 40),
                          decoration: const InputDecoration.collapsed(
                              hintText: "Title"),
                        ),
                        const Divider(),
                        TextFormField(
                          controller: bodyCtrl,
                          cursorColor: Colors.amber,
                          maxLines: 100,
                          minLines: 1,
                          decoration:
                              const InputDecoration.collapsed(hintText: "Body"),
                        )
                      ],
                    ),
                  ),
                ),

                // save posts button
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: BlocBuilder<UpdatePostsDataCubit, UpdatePostDataState>(
                    builder: (context, updateState) {
                      return BlocBuilder<CreatePostsDataCubit,
                          CreatePostDataState>(
                        builder: (context, state) {
                          return CustomButtonWidget(
                            isLoading: state.state == AppState.loading ||
                                updateState.state == AppState.loading,
                            onTap: () {
                              if (widget.data != null) {
                                updatePost();
                              } else {
                                createPost();
                              }
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
