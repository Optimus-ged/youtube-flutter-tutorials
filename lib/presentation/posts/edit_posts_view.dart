import 'package:flutter/material.dart';
import 'package:landing_and_login_screen/presentation/shared_widgets/custom_btn_widget.dart';

class EditPostsView extends StatelessWidget {
  const EditPostsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.close,
                color: Colors.amber[800],
              ),
            ),
          ),
          body: Column(
            children: [
              // text form fields widget
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      TextFormField(
                        cursorColor: Colors.amber,
                        style: const TextStyle(fontSize: 40),
                        decoration:
                            const InputDecoration.collapsed(hintText: "Title"),
                      ),
                      const Divider(),
                      TextFormField(
                        cursorColor: Colors.amber,
                        maxLines: 100,
                        minLines: 1,
                        decoration:
                            const InputDecoration.collapsed(hintText: "Body"),
                      )
                    ],
                  ),
                ),
              ),

              // save posts button
              const Padding(
                padding: EdgeInsets.all(20),
                child: CustomButtonWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
