import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:landing_and_login_screen/business_logic/app_state.dart';
import 'package:landing_and_login_screen/business_logic/cubits/post_data/posts_data_cubit.dart';
import 'package:landing_and_login_screen/business_logic/cubits/post_data/posts_data_state.dart';
import 'package:landing_and_login_screen/data/models/post_data_model.dart';
import 'package:lottie/lottie.dart';
import 'posts_details_view.dart';
import 'edit_posts_view.dart';
import 'search_posts_view.dart';

class PostsView extends StatefulWidget {
  const PostsView({super.key});

  @override
  State<PostsView> createState() => _PostsViewState();
}

class _PostsViewState extends State<PostsView> {
  @override
  void initState() {
    context.read<PostsDataCubit>().load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostsDataCubit, PostDataState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              body: Scrollbar(
                radius: const Radius.circular(30),
                child: state.state == AppState.loading
                    ? Center(
                        child: LottieBuilder.asset(
                          "assets/images/loading.json",
                        ),
                      )
                    : CustomScrollView(
                        slivers: [
                          SliverToBoxAdapter(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 20,
                                right: 20,
                                bottom: 40,
                                top: 10,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // row
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const EditPostsView(),
                                            ),
                                          );
                                        },
                                        icon: Icon(
                                          Icons.add,
                                          color: Colors.amber[800],
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      IconButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const SearchPostsView(),
                                            ),
                                          );
                                        },
                                        icon: Icon(
                                          Icons.search,
                                          color: Colors.amber[800],
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      CircleAvatar(
                                        radius: 22,
                                        backgroundColor: Colors.amber[100],
                                        child: const Icon(
                                          Icons.face,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),

                                  // text
                                  const SizedBox(height: 40),
                                  const Text(
                                    "My posts",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SliverPadding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              right: 20,
                              bottom: 100,
                            ),
                            sliver: SliverList.builder(
                              itemCount: state.data!.length,
                              itemBuilder: (context, index) {
                                return buildPostItem(context,
                                    data: state.data![index]);
                              },
                            ),
                          )
                        ],
                      ),
              ),
            ),
          ),
        );
      },
    );
  }

  buildPostItem(BuildContext context, {required PostDataModel data}) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const PostsDetailsView(),
      )),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Material(
          color: Colors.amber[100],
          borderRadius: BorderRadius.circular(30),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
        ),
      ),
    );
  }
}
