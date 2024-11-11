import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tdl_app/data/database.dart';
import 'package:tdl_app/pages/home_page.dart';
import 'package:tdl_app/pages/setting_page.dart';
import 'package:tdl_app/utilities/dialog_box.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});
  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  //reference the hive box
  final _myBox = Hive.box('mybox');
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    // create the default data if this is the first time openin the app
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      //there already exists data
      db.loadData();
    }
    super.initState();
  }

  // text controller
  final _controller = TextEditingController();

  // untuk ketika centang
  void checkBoxChecked(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateData();
  }

  // untuk save

  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  // untuk bisa menambahkan
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  // untuk menghapus
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("List Removed"),
      ),
    );
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: Image.asset(
            'assets/images/logo.png',
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Center(
          child: Text(
            'TO DO',
            style: TextStyle(color: Colors.white),
          ),
        ),
        actions: [
          Builder(builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
              ),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            );
          })
        ],
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          createNewTask();
        },
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.tertiary,
              borderRadius: BorderRadius.circular(100)),
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(10),
          child: Icon(
            Icons.add,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
      endDrawer: Drawer(
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: ListView(
          children: [
            DrawerHeader(
              child: Container(
                child: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
                color: Colors.white,
              ),
              title: const Text(
                'H O M E',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.settings,
                color: Colors.white,
              ),
              title: const Text(
                "S E T T I N G",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingPage(),
                  ),
                );
              },
            )
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return HomePage(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) => checkBoxChecked(value, index),
            deleteTask: (context) => deleteTask(index),
          );
        },
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
    );
  }
}
