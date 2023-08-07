import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business_logic/cubits/posts/posts_cubits.dart';
import '../../../data/models/posts_models.dart';

class SearchPostView extends StatefulWidget {
  final List<PostData> posts;
  const SearchPostView({required this.posts, super.key});

  @override
  State<SearchPostView> createState() => _SearchPostViewState();
}

class _SearchPostViewState extends State<SearchPostView> {
  

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 0,
            vertical: 20,
          ),
          child: Column(
            children: [
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
                          fillColor: Colors.grey[100],
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
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  itemCount: context.watch<PostsCubit>().state.searchedPostsList!.length,
                  itemBuilder: (context, index) => Text(
                    "${context.watch<PostsCubit>().state.searchedPostsList![index].title}",
                  ),
                ),
              )
            ],
          ),
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
