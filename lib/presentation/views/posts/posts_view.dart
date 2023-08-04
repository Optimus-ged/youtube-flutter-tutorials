import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:landing_and_login_screen/presentation/views/posts/posts_details.dart';
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
                    "My posts",
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
              itemBuilder: (context, index) => buildPostItem(data[index]),
            ),
          )
        ],
      );
    }
    return Center(
      child: Text("${context.watch<PostsCubit>().state.errorMessage}"),
    );
  }

  buildPostItem(PostData data) {
    return Container(
      decoration: BoxDecoration(
        // color: Colors.pink.withOpacity(0.2),
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(
          30,
        ),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      // padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  "${data.title}",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    height: 1.2,
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
                Text(
                  "${data.body}",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black26,
                  ),
                )
              ],
            ),
          ),
          // const SizedBox(height: 20),
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PostsDetailsView(data: data),
                  ),
                );
              },
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: const BoxDecoration(
                  border: Border(
                      top: BorderSide(
                    width: 0.2,
                    color: Colors.grey,
                  )),
                ),
                child: const Icon(Icons.edit),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
