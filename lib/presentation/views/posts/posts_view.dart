import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'search_post_view.dart';
import 'package:lottie/lottie.dart';
import 'edit_posts_view.dart';
import 'posts_details.dart';
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
    context.read<PostsCubit>().fetch();
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
          // floatingActionButton:
          //     context.watch<PostsCubit>().state.state != CustomAppStates.loading
          //         ? Padding(
          //             padding: const EdgeInsets.only(right: 5),
          //             child: FloatingActionButton(
          //               backgroundColor: Colors.amber[800],
          //               onPressed: () {
          //                 Navigator.of(context).push(
          //                   MaterialPageRoute(
          //                     builder: (context) => const EditPostsView(),
          //                   ),
          //                 );
          //               },
          //               child: const Icon(
          //                 Icons.add,
          //                 color: Colors.white,
          //               ),
          //             ),
          //           )
          //         : const SizedBox(),
        ),
      ),
    );
  }

  buildWidget() {
    if (context.watch<PostsCubit>().state.state == CustomAppStates.loading) {
      return Center(
        child: Lottie.asset("assets/images/loading.json"),
      );
    } else if (context.watch<PostsCubit>().state.state ==
        CustomAppStates.success) {
      List<PostData> data = context.watch<PostsCubit>().state.postsData!;
      return Scrollbar(
        radius: const Radius.circular(30),
        thumbVisibility: true,
        child: CustomScrollView(
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
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const EditPostsView(),
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
                                builder: (context) => const SearchPostView(),
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
                        )
                      ],
                    ),
                    const SizedBox(height: 40),
                    const Text(
                      "My posts",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
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
                itemCount: data.take(10).length,
                itemBuilder: (context, index) => buildPostItem(
                  data[index],
                ),
              ),
            )
          ],
        ),
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
        color: Colors.amber[100],
        borderRadius: BorderRadius.circular(30),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      // padding: const EdgeInsets.all(20),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => PostsDetailsView(data: data),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
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
              // const SizedBox(height: 20),
              // BuildBtmItemArea(
              //   data: data,
              //   radiusValue: 30,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
