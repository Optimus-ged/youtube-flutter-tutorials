import 'package:flutter/material.dart';
import 'package:landing_and_login_screen/presentation/shared_widgets/custom_alert_dialog_widget.dart';

class BuildBottomArea extends StatelessWidget {
  const BuildBottomArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        customButton(icon: Icons.edit),
        customButton(
          icon: Icons.delete,
          onTap: () => showDialog(
            context: context,
            builder: (context) => const CustomAlertDialogWidget(),
          ),
        ),
      ],
    );
  }

  customButton({required IconData icon, VoidCallback? onTap}) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
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
      ),
    );
  }
}
