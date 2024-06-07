import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List listOfTasks = [];
  String textFieldValue = "";

  @override
  void initState() {
    super.initState();
    listOfTasks.addAll([
      'Wash the car',
      'Create new flutter project',
      'Fix bugs in my oun project'
    ]);
  }

  void _menuOpen() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            title: Text('Menu'),
          ),
          body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ElevatedButton(onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            }, child: Text('Back'))],
          ));
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Tasks',
          style: TextStyle(fontSize: 18),
        ),
        actions: [
          IconButton(onPressed: _menuOpen, icon: Icon(Icons.menu_outlined))
        ],
      ),
      body: ListView.builder(
          itemCount: listOfTasks.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: Key(listOfTasks[index]),
              child: Card(
                child: ListTile(
                  title: Text(listOfTasks[index]),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      setState(() {
                        listOfTasks.removeAt(index);
                      });
                    },
                  ),
                ),
              ),
              onDismissed: (direction) {
                if (direction == DismissDirection.endToStart ||
                    direction == DismissDirection.startToEnd) {
                  setState(() {
                    listOfTasks.removeAt(index);
                  });
                }
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 195, 195, 195),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Add new task'),
                    content: TextField(
                      decoration: InputDecoration(hintText: 'Enter this field'),
                      onChanged: (String value) {
                        setState(() {
                          textFieldValue = value;
                        });
                      },
                    ),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            if (textFieldValue.isNotEmpty) {
                              setState(() {
                                listOfTasks.add(textFieldValue);
                              });
                              Navigator.of(context).pop();
                            }
                          },
                          child: Text('Add new task'))
                    ],
                  );
                });
          },
          child: Icon(Icons.add)),
    );
  }
}
