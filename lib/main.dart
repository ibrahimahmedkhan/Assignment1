import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<User> users = [
    User(name: "Google", email: "gmaild@gmail.com", color: Colors.green),
    User(name: "Facebook", email: "facebook@gmail.com", color: Colors.red),
    User(name: "Apple", email: "apple@gmail.com", color: Colors.green),
    User(name: "Meta", email: "meta@gmail.com", color: Colors.red),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 60, 20, 0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  hintText: "Search",
                ),
              ),
            ),
            Expanded(
              child: ListView(
                  padding: const EdgeInsets.only(top: 4),
                  children: users
                      .map(
                        (user) => Padding(
                          padding: const EdgeInsets.only(bottom: 8.9),
                          child: Material(
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: ListTile(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                tileColor: user.color,
                                title: Text(user.name),
                                subtitle: Text(user.email),
                                leading: CircleAvatar(
                                    radius: 20,
                                    child: Text(user.name.substring(0, 1)))),
                          ),
                        ),
                      )
                      .toList()),
            ),
          ],
        ),
      )),
    );
  }
}

class User {
  final String name;
  final String email;
  final Color color;

  User({required this.name, required this.email, required this.color});
}
