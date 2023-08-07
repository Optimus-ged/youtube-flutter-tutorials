import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business_logic/cubits/posts/posts_cubits.dart';
import '../../business_logic/cubits/posts/posts_states.dart';
import '../../business_logic/custom_states.dart';

class CustomAlertDialog extends StatelessWidget {
  final VoidCallback? onTapDelete;
  const CustomAlertDialog({required this.onTapDelete, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<PostsCubit, PostsState>(
      listener: (context, state) {
        if (state.state == CustomAppStates.success) {
          Navigator.of(context)
            ..pop()
            ..pop();
        }
      },
      child: AlertDialog(
        backgroundColor: Colors.white,
        title: const Text("Delete post"),
        content: const Text("Do you really wanna delete this post?"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Text("No"),
          ),
          context.watch<PostsCubit>().state.state == CustomAppStates.loading
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(),
                )
              : IconButton(
                  onPressed: onTapDelete,
                  icon: Text(
                    "Yes",
                    style: TextStyle(
                      color: Colors.amber[800],
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
