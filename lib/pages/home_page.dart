import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged,
      required this.deleteTask});

  final String taskName;
  final bool taskCompleted;
  void Function(bool?)? onChanged;
  void Function(BuildContext)? deleteTask;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteTask,
              icon: Icons.delete,
              backgroundColor: Colors.redAccent,
              borderRadius: BorderRadius.circular(15),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.tertiary,
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              // Bagian Centang Box/ CheckBox
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.white,
              ),
              // Bagian Text
              Text(
                taskName,
                style: TextStyle(
                    fontSize: 22,
                    color: Theme.of(context).colorScheme.onPrimary,
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
