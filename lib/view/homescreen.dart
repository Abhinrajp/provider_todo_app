import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_todoappli/controller/controller.dart';
import 'package:provider_todoappli/model/model.dart';
import 'package:provider_todoappli/view/detailscreen.dart';
import 'package:provider_todoappli/view/formscreen.dart';
import 'package:provider_todoappli/view/searchscreen.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Todo',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.pink[700],
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Searchscreen(),
                    ));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: Consumer<Todocontroller>(
        builder: (context, value, child) {
          List<Todomodel> todos = value.todolist;
          if (todos.isEmpty) {
            return const Center(
              child: Text('No todo'),
            );
          } else {
            return GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                final todo = todos[index];
                // final todoid = todo.id;
                return GestureDetector(
                  onLongPress: () {
                    if (todo.id != null) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: Colors.white,
                            title: const Text('Are you sure?'),
                            content:
                                const Text('Do you want to delete the todo?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  value.deletetodo(todo.id!);
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Yes'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('No'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Detailscreen(todoid: todo.id!),
                        ));
                  },
                  child: Card(
                    color: const Color.fromARGB(253, 246, 101, 149),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          todo.enddate,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                        Text(
                          todo.title,
                          style: const TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        SizedBox(
                          width: 90,
                          child: Text(
                            todo.content,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.black26,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: todos.length,
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Addtodoscreen(),
              ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
