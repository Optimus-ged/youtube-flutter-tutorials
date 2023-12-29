import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final VoidCallback? onTap;
  const CustomButtonWidget({this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.maxFinite,
      child: ElevatedButton(
        onPressed: onTap,
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
        child: const Text(
          "Save post",
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
