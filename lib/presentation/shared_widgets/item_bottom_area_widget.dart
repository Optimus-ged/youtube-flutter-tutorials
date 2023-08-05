import 'package:flutter/material.dart';
import '../views/posts/edit_posts_view.dart';

import '../../data/models/posts_models.dart';

class BuildBtmItemArea extends StatelessWidget {
  final PostData data;
  final double radiusValue;
  const BuildBtmItemArea({
    required this.data,
    this.radiusValue = 0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildbtn(
            icon: Icons.edit,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(radiusValue),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => EditPostsView(
                    data: data,
                  ),
                ),
              );
            },
          ),
          buildbtn(
            icon: Icons.delete,
            hasBorderSide: false,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(radiusValue),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  buildbtn(
      {VoidCallback? onTap,
      bool hasBorderSide = true,
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
            decoration: hasBorderSide
                ? BoxDecoration(
                    color: Colors.amber[100],
                    border: Border(
                      right: BorderSide(
                          width: hasBorderSide ? 0.2 : 0, color: Colors.grey),
                    ),
                  )
                : BoxDecoration(
                    color: Colors.amber[100],
                  ),
            child: Icon(
              icon,
              color: Colors.amber[800],
            ),
          ),
        ),
      ),
    );
  }
}
