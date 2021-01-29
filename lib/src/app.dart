import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import './models/image_model.dart';
import 'dart:convert';
import './widgets/image_list.dart';

class App extends StatefulWidget {
  createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images = [];

  void fetchImage() async {
    counter++;
    String url = 'https://jsonplaceholder.typicode.com';
    final response = await get('$url/photos/$counter');

    final imageModel = ImageModel.fromJson(json.decode(response.body));
    setState(() {
      images.add(imageModel);
    });
  }

  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: fetchImage,
        ),
        appBar: AppBar(
          title: Text('Lets see some images!'),
          backgroundColor: Colors.teal,
        ),
        body: ImageList(images),
      ),
    );
  }
}
