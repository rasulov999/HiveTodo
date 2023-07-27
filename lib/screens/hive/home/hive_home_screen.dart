import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_db/widgets/custom_bottomsheet.dart';

class HiveHomeScreen extends StatefulWidget {
  const HiveHomeScreen({super.key});

  @override
  State<HiveHomeScreen> createState() => _HiveHomeScreenState();
}

class _HiveHomeScreenState extends State<HiveHomeScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController desController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Hive Example"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF8685E7),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return CustomBottomSheet(
                controller1: titleController,
                controller2: desController,
                controller3: dateController,
                onTap: () {
                  
                },
              );
            },
          );
        },
        child: const Text(
          "+",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SvgPicture.asset("assets/svg/home_screen_icon.svg"),
          ),
          const Text(
            "What do you want to do today?",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          const Text(
            "Tap + to add your tasks",
            style: TextStyle(fontSize: 18, color: Colors.white),
          )
        ],
      ),
    );
  }
}
