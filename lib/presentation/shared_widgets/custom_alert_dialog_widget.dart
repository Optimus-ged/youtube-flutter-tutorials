import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:landing_and_login_screen/business_logic/app_state.dart';
import 'package:landing_and_login_screen/business_logic/cubits/delete_post/delete_post_state.dart';
import 'package:landing_and_login_screen/business_logic/cubits/delete_post/delete_posts_data_cubit.dart';
import 'package:landing_and_login_screen/business_logic/cubits/post_data/posts_data_cubit.dart';
import 'package:landing_and_login_screen/data/models/post_data_model.dart';

class CustomAlertDialogWidget extends StatelessWidget {
  final PostDataModel data;
  const CustomAlertDialogWidget({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeletePostsDataCubit, DeletePostDataState>(
      listener: (context, state) {
        if(state.state == AppState.success){
          context.read<PostsDataCubit>().deletePost(data);
          Navigator.of(context)..pop()..pop();
        }
      },
      child: AlertDialog(
        title: const Text("Delete post"),
        content: const Text("Do you really wanna delete this post?"),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Text("No"),
          ),
          BlocBuilder<DeletePostsDataCubit, DeletePostDataState>(
            builder: (context, state) {
              if (state.state == AppState.loading) {
                return const CircularProgressIndicator();
              } else {
                return IconButton(
                  onPressed: () {
                    context.read<DeletePostsDataCubit>().delete(data);
                  },
                  icon: Text(
                    "Yes",
                    style: TextStyle(
                      color: Colors.amber[800],
                    ),
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
