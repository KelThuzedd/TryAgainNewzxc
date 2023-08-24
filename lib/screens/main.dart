import 'package:flutter/material.dart';
import '../models/data_model.dart';
import '../screens/age_group_activity.dart';
import '../screens/group2_activity.dart';
import '../screens/data_list.dart';
import '../data_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final MainPage mainPage = MainPage();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: mainPage,
      routes: {
        '/ageGroup': (context) => AgeGroupActivity(dataList: mainPage.dataList),
        '/group2': (context) => Group2Activity(dataList: mainPage.dataList),


        '/group2ToAgeGroup': (context) => AgeGroupActivity(dataList: mainPage.dataList), // Добавляем новый маршрут

      },
    );
  }
}


class MainPage extends StatelessWidget {
  final DataService dataService = DataService();
  late List<DataModel> dataList; // Store the dataList here

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DataModel>>(
      future: dataService.readData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Main Activity'),
            ),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Main Activity'),
            ),
            body: Center(
              child: Text('Error loading data.'),
            ),
          );
        } else {
          dataList = snapshot.data!;
          return Scaffold(
            appBar: AppBar(
              title: Text('Main Activity'),
            ),
            body: DataList(dataList: dataList),
          );
        }
      },
    );
  }
}
