import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
        centerTitle: true,
      ),
      body: Container(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Go to ToDo List',
                style: TextStyle(fontSize: 20),
              ),
              Padding(padding: EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 5.0)),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/todo');
                  },
                  child: Text(
                    'ToDo',
                    style: TextStyle(fontSize: 18, color: Colors.blue),
                  )),
            ],
          )
        ],
      )),
    );
  }
}
