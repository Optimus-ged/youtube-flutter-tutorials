import 'package:flutter/material.dart';

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
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(radiusValue),
            ),
            onTap: () {},
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
                    border: Border(
                      right: BorderSide(
                          width: hasBorderSide ? 0.2 : 0, color: Colors.grey),
                    ),
                  )
                : const BoxDecoration(),
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
