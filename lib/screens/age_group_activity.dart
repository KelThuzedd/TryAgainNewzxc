import 'package:flutter/material.dart';
import '../models/data_model.dart';
import '../screens/detail_activity.dart'; // Import DetailActivity

class AgeGroupActivity extends StatelessWidget {
  final List<DataModel> dataList;
  AgeGroupActivity({required this.dataList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Age Group Activity'),
      ),
      body: ListView.builder(
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          final data = dataList[index];
          return ListTile(
            title: Text(data.name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailActivity(data: data),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
