import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<List> data = [
    {'name': 'Jenil', 'age': 25},
    {'name': 'Jenil', 'age': 25},
    {'name': 'Jenil', 'age': 25},
  ] as Future<List>;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: data,
          builder: (context, snapshot) {
            List posts = snapshot.data as List;
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return TimerListTile(
                    title: Text(
                      posts[index].name,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      posts[index].age.toString(),
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
