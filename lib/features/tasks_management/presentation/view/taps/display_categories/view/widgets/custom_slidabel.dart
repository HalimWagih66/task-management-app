import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CustomSlidable extends StatelessWidget {
  const CustomSlidable({super.key, required this.child, required this.onPressedDelete,required this.onPressedEdit});
  final Widget child;
  final void Function() onPressedDelete;
  final void Function() onPressedEdit;
  @override
  Widget build(BuildContext context) {
    return Slidable(
        endActionPane: ActionPane(
          extentRatio: .48,
          motion: const DrawerMotion(),
          children: [
            SlidableAction(
              onPressed: (BuildContext context) {
                onPressedDelete();
              }, icon: Icons.delete,
              backgroundColor: Colors.red,
              label: "Delete",
            ),
            SlidableAction(
              onPressed: (BuildContext context) async {
                onPressedEdit();
              },
              icon: Icons.edit,
              backgroundColor: Colors.blueAccent,
              borderRadius: const BorderRadius.only(bottomRight: Radius.circular(10), topRight: Radius.circular(10)),
              label: "Edit",
              spacing: 0,
            ),
          ],
        ),
        child: child,
    );
  }
}
