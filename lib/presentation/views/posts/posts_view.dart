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
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: buildWidget(),
        ),
      ),
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
      return CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 10,
                bottom: 40,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.search),
                      ),
                      const SizedBox(width: 10),
                      CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.grey[100],
                      )
                    ],
                  ),
                  const SizedBox(height: 40),
                  Text(
                    "My notes",
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.grey[400],
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverList.builder(
              itemCount: data.length,
              itemBuilder: (context, index) => Container(
                decoration: BoxDecoration(
                  color: Colors.pink.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(
                    30,
                  ),
                ),
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${data[index].title}",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        height: 1.2,
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    ),
                    Text(
                      "${data[index].body}",
                      style:
                          const TextStyle(fontSize: 20, color: Colors.black26),
                    ),
                  ],
                ),
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
