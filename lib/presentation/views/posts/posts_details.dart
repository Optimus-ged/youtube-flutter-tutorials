import 'package:flutter/material.dart';
import '../../../data/models/posts_models.dart';
import '../../shared_widgets/item_bottom_area_widget.dart';

class PostsDetailsView extends StatelessWidget {
  final PostData data;
  const PostsDetailsView({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: Container(
              // color: Colors.amber,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Row(
                children: [
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Row(
                        children: [
                          const Icon(Icons.arrow_back),
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.grey[100],
                            child: Text(
                              data.title!.substring(0, 1).toUpperCase(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      "${data.title}",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    "${data.body}",
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              BuildBtmItemArea(data: data),
            ],
          ),
        ),
      ),
    );
  }
}
