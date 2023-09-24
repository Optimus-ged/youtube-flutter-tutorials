import 'package:flutter/material.dart';
import 'package:landing_and_login_screen/presentation/shared_widgets/build_bottom_area.dart';

class PostsDetailsView extends StatelessWidget {
  const PostsDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Row(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.arrow_back,
                        color: Colors.amber[500],
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.amber[100],
                        radius: 20,
                        child: const Text("A"),
                      )
                    ],
                  ),
                  const SizedBox(width: 5),
                  const Expanded(
                    child: Text(
                      "This is a youtube tutorial",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12),
                    ),
                  )
                ],
              ),
            ),
          ),
          body: const Column(
            children: [
              // post body section
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "This is a youtube tutorial This is a youtube tutorial This is a youtube tutorial This is a youtube tutorial This is a youtube tutorial This is a youtube tutorial",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),

              // buttons section
              BuildBottomArea()
            ],
          ),
        ),
      ),
    );
  }
}
