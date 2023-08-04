import 'package:flutter/material.dart';
import 'package:landing_and_login_screen/data/models/posts_models.dart';
import 'package:landing_and_login_screen/presentation/views/posts/posts_details.dart';

class BuildBtmItemArea extends StatelessWidget {
  final PostData data;
  const BuildBtmItemArea({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 0.2,
            color: Colors.grey,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildbtn(
            icon: Icons.edit,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
            ),
            onTap: () {
              
            },
          ),
          buildbtn(
            icon: Icons.delete,
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(30),
            ),
          ),
        ],
      ),
    );
  }

  buildbtn(
      {VoidCallback? onTap,
      required IconData icon,
      required BorderRadius borderRadius}) {
    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: borderRadius,
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15),
            decoration: const BoxDecoration(
              border: Border(
                right: BorderSide(width: 0.2, color: Colors.grey),
              ),
            ),
            child: Icon(
              icon,
              color: Colors.grey[500],
            ),
          ),
        ),
      ),
    );
  }
}
