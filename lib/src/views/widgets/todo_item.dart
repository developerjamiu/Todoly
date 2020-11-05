import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  final String task;
  final Function deleteClicked;

  const TodoItem({
    Key key,
    this.task,
    this.deleteClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(24, 8.0, 8.0, 8.0),
      margin: EdgeInsets.only(bottom: 24),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            task,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          IconButton(
            onPressed: deleteClicked,
            icon: Icon(
              Icons.delete,
              color: Colors.red,
              size: 28.0,
            ),
          ),
        ],
      ),
    );
  }
}
