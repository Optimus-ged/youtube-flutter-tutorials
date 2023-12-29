import 'package:flutter/material.dart';

class CustomAlertDialogWidget extends StatelessWidget {
  const CustomAlertDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Delete post"),
      content: const Text("Do you really wanna delete this post?"),
      backgroundColor: Colors.white,
      actions: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Text("No"),
        ),
        IconButton(
          onPressed: () {},
          icon: Text(
            "Yes",
            style: TextStyle(
              color: Colors.amber[800],
            ),
          ),
        )
      ],
    );
  }
}
