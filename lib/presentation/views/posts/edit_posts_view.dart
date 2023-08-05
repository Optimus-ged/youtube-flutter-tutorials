import 'package:flutter/material.dart';
import '../../../data/models/posts_models.dart';
import '../../shared_widgets/custom_btn_widget.dart';

class EditPostsView extends StatefulWidget {
  final PostData? data;
  const EditPostsView({this.data, super.key});

  @override
  State<EditPostsView> createState() => _EditPostsViewState();
}

class _EditPostsViewState extends State<EditPostsView> {
  initializeFields(PostData data) {
    titleController.text = "${data.title}";
    bodyController.text = "${data.body}";
  }

  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    bodyController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    if (widget.data != null) {
      initializeFields(widget.data!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: Padding(
              padding: const EdgeInsets.only(right: 5),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.close,
                  color: Colors.amber[800],
                ),
              ),
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: titleController,
                        cursorColor: Colors.amber,
                        style: const TextStyle(
                          fontSize: 40,
                        ),
                        decoration: const InputDecoration.collapsed(
                          hintText: "Title",
                        ),
                      ),
                      const Divider(),
                      TextFormField(
                        controller: bodyController,
                        cursorColor: Colors.amber,
                        maxLines: 10,
                        minLines: 1,
                        decoration: const InputDecoration.collapsed(
                          hintText: "Body",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: CustomButtonWidget(
                  data: widget.data,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
