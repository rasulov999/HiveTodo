import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_db/data/db/local_db.dart';
import 'package:todo_db/data/models/db_model.dart';
import 'package:todo_db/widgets/custom_bottomsheet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController desController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  List<UserModel> allUsers = [];

  _init() async {
    allUsers = await LocalDatabase.getUsers();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
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
                onTap: () {},
              );
            },
          );
        },
        child: const Text(
          "+",
          style: TextStyle(fontSize: 20),
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text("Sqflite Example"),
        centerTitle: true,
      ),
      body: allUsers.isEmpty
          ? Column(
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
            )
          : ListView(
              children: List.generate(
                allUsers.length,
                (index) => ListTile(
                  title: Text("${allUsers[index].name}"),
                  subtitle: Text("${allUsers[index].age}"),
                  trailing: IconButton(
                    onPressed: () async {
                      // LocalDatabase.deleteCachedUserById(item.id!);
                      // cachedUsers = await LocalDatabase.getAllCachedUsers();
                      // setState(() {});
                    },
                    icon: const Icon(Icons.delete),
                  ),
                ),
              ),
            ),
    );
  }
}
