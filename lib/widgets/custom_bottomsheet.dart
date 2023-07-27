import 'package:flutter/material.dart';
import 'package:todo_db/screens/home/widgets/custom_textfield.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    super.key,
    required this.controller1,
    required this.controller2,
    required this.controller3,
    required this.onTap
  });

  final TextEditingController controller1;
  final TextEditingController controller2;
  final TextEditingController controller3;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFF363636),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Add Task",
            style: TextStyle(
                fontWeight: FontWeight.w700, color: Colors.white, fontSize: 20),
          ),
          CustomTextField(hintText: "Title", controller: controller1),
          CustomTextField(hintText: "Description", controller: controller2),
          CustomTextField(hintText: "Date time", controller: controller3),
          Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
              iconSize: 34,
              onPressed: onTap,
              icon: const Icon(
                Icons.send,
                color: Color(0xFF8687E7),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
