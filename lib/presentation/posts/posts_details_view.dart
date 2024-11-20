import 'package:flutter/material.dart';
import 'package:landing_and_login_screen/data/models/post_data_model.dart';
import 'package:landing_and_login_screen/presentation/shared_widgets/build_bottom_area.dart';

class PostsDetailsView extends StatelessWidget {
  final PostDataModel data;
  const PostsDetailsView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: Container(
              padding: const EdgeInsets.only(
                left: 5,
                right: 20,
                top: 10,
                bottom: 10,
              ),
              child: Row(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.amber[500],
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.amber[100],
                        radius: 20,
                        child: Text("${data.title?[0]}"),
                      )
                    ],
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      "${data.title}",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 12),
                    ),
                  )
                ],
              ),
            ),
          ),
          body: Column(
            children: [
              // post body section
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

              // buttons section
               BuildBottomArea(data: data,)
            ],
          ),
        ),
      ),
    );
  }
}
