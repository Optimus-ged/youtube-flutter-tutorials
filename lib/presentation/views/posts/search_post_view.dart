import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'edit_posts_view.dart';
import '../../../business_logic/cubits/posts/posts_cubits.dart';

class SearchPostView extends StatelessWidget {
  const SearchPostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.amber[800],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Search post",
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.amber[800],
                        ),
                        filled: true,
                        fillColor: Colors.amber[100],
                        focusedBorder: buildOutLineBorder(),
                        enabledBorder: buildOutLineBorder(),
                      ),
                      onChanged: (value) {
                        context.read<PostsCubit>().filterPosts(value);
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Scrollbar(
                radius: const Radius.circular(30),
                thumbVisibility: true,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  itemCount: context
                      .watch<PostsCubit>()
                      .state
                      .searchedPostsList!
                      .length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EditPostsView(
                          data: context
                              .watch<PostsCubit>()
                              .state
                              .searchedPostsList![index],
                        ),
                      ),
                    ),
                    child: Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        border: Border.all(width: 0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "${context.watch<PostsCubit>().state.searchedPostsList![index].title}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  buildOutLineBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Colors.grey,
        width: 0.1,
      ),
      gapPadding: 10,
    );
  }
}
