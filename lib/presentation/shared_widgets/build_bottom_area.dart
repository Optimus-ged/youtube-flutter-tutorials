import 'package:flutter/material.dart';

class BuildBottomArea extends StatelessWidget {
  const BuildBottomArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        customButton(icon: Icons.edit),
        customButton(icon: Icons.delete),
      ],
    );
  }

  customButton({required IconData icon}) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.amber[100],
          border: const Border(
            right: BorderSide(
              color: Colors.grey,
              width: 0.2,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Icon(
            icon,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
