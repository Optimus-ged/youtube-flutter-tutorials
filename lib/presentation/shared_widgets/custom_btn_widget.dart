import 'package:flutter/material.dart';
import 'package:landing_and_login_screen/data/models/posts_models.dart';

class CustomButtonWidget extends StatelessWidget {
  final PostData? data;
  const CustomButtonWidget({this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 60,
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          backgroundColor: MaterialStatePropertyAll(
            Colors.amber[800],
          ),
          elevation: const MaterialStatePropertyAll(0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Text(
            data == null ? "Save post" : "Update post",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
