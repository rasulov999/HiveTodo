import 'package:flutter/material.dart';
import 'package:todo_db/screens/hive/home/hive_home_screen.dart';
import 'package:todo_db/screens/home/home_screen.dart';

class OptionScreen extends StatelessWidget {
  const OptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: const ButtonStyle(
                  maximumSize: MaterialStatePropertyAll(
                    Size(double.infinity, 60),
                  ),
                  minimumSize: MaterialStatePropertyAll(
                    Size(double.infinity, 60),
                  ),
                  backgroundColor: MaterialStatePropertyAll(
                    Color(0xFF8685E7),
                  ),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder:(context) => HomeScreen(),));
                },
                child: const Text(
                  "Sqflite",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: const ButtonStyle(
                  maximumSize: MaterialStatePropertyAll(
                    Size(double.infinity, 60),
                  ),
                  minimumSize: MaterialStatePropertyAll(
                    Size(double.infinity, 60),
                  ),
                  backgroundColor: MaterialStatePropertyAll(
                    Color(0xFF8685E7),
                  ),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder:(context) => HiveHomeScreen(),));
                },
                child: const Text(
                  "Hive",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
