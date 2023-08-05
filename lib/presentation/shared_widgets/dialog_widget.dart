import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: const Text("Delete post"),
      content: const Text("Do you really wanna delete this post?"),
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
