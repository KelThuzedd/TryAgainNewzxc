import 'package:flutter/material.dart';
import '../models/data_model.dart';

class DetailActivity extends StatelessWidget {
  final DataModel data;

  const DetailActivity({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Activity'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Text('ID: ${data.id}'),
          Text('Name: ${data.name}'),
          Text('Description: ${data.description}'),
          SizedBox(height: 16.0),
          Image.asset(
            'assets/${data.imageName}.jpg',
            fit: BoxFit.contain,
            height: 200,
          ),
        ],
      ),
    );
  }
}