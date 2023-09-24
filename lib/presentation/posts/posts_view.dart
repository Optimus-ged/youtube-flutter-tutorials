import 'package:flutter/material.dart';
import 'package:landing_and_login_screen/presentation/posts/posts_details_view.dart';
import 'edit_posts_view.dart';
import 'search_posts_view.dart';

class PostsView extends StatelessWidget {
  const PostsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Scrollbar(
            radius: const Radius.circular(30),
            child: CustomScrollView(
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
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return buildPostItem(context);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildPostItem(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const PostsDetailsView(),
      )),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Material(
          color: Colors.amber[100],
          borderRadius: BorderRadius.circular(30),
          child: const Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Tutorials",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    height: 1.2,
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
                Text(
                  "est rerum tempore vitae sequi sint nihil reprehenderit dolorbeatae ed dolores neque fugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis qui aperiam non debitis possimus quineque nisi nulla",
                  style: TextStyle(
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
