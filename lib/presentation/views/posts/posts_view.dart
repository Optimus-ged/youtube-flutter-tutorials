import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/posts_models.dart';
import '../../../business_logic/cubits/posts/posts_cubits.dart';
import '../../../business_logic/custom_states.dart';

class PostsView extends StatefulWidget {
  const PostsView({super.key});

  @override
  State<PostsView> createState() => _PostsViewState();
}

class _PostsViewState extends State<PostsView> {
  @override
  void initState() {
    context.read<PostsCubit>().getPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildWidget(),
    );
  }

  buildWidget() {
    if (context.watch<PostsCubit>().state.state == CustomAppStates.loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (context.watch<PostsCubit>().state.state ==
        CustomAppStates.success) {
      List<PostData> data = context.watch<PostsCubit>().state.postsData!;
      return Column(
        children: [
          Container(
            padding: const EdgeInsets.all(50),
            color: Colors.amber,
            child: const Text("data"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) => Text(
                "${data[index].title}",
              ),
            ),
          )
        ],
      );
    }
    return Center(
      child: Text("${context.watch<PostsCubit>().state.errorMessage}"),
    );
  }
}
