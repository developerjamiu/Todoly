import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:todoly/src/models/todo.dart';

import '../../core/constants.dart';
import '../../viewmodels/home_viewmodel.dart';
import '../widgets/app_logo.dart';
import '../widgets/todo_item.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.only(left: 24.0),
                color: kPrimaryColor,
                child: AppLogo(),
              ),
            ),
            Consumer<HomeViewModel>(
              builder: (context, model, _) {
                return Expanded(
                  flex: 7,
                  child: model.todos.isEmpty
                      ? Padding(
                          padding: const EdgeInsets.symmetric(vertical: 32.0),
                          child: SvgPicture.asset(
                            'assets/nothing.svg',
                          ),
                        )
                      : Container(
                          padding: EdgeInsets.fromLTRB(24, 24, 24, 0),
                          color: Colors.grey.shade300,
                          child: ListView.builder(
                            itemCount: model.todos.length,
                            itemBuilder: (context, index) => TodoItem(
                              task: model.todos[index].task,
                              deleteClicked: () => model.removeTodo(index),
                            ),
                          ),
                        ),
                );
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => addTodo(context),
          backgroundColor: kPrimaryColor,
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  void addTodo(BuildContext context) {
    final newTodoController = TextEditingController();

    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          top: 30.0,
          right: 30.0,
          left: 30.0,
          bottom: MediaQuery.of(context).viewInsets.bottom + 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: newTodoController,
              decoration: InputDecoration(
                labelText: 'Add Todo',
              ),
            ),
            SizedBox(height: 48.0),
            RaisedButton(
              color: kPrimaryColor,
              onPressed: () => addNewTodo(context, newTodoController.text),
              child: Text(
                'Add Task',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.5,
                ),
              ),
              padding: const EdgeInsets.all(20),
              elevation: 0,
            )
          ],
        ),
      ),
    );
  }

  void addNewTodo(BuildContext context, String text) {
    final homeViewModel = Provider.of<HomeViewModel>(context, listen: false);

    homeViewModel.addTodo(
      Todo(
        task: text,
        timestamp: DateTime.now(),
      ),
    );

    Navigator.of(context).pop();
  }
}
