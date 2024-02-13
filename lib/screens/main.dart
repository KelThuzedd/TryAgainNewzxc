import 'package:flutter/material.dart';
import '../models/data_model.dart';
import '../screens/age_group_activity.dart';
import '../screens/group2_activity.dart';
import '../screens/data_list.dart';
import 'package:tryagainnew/data_service.dart';

import '../styles.dart'; // Import the styles.dart file

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final DataService dataService = DataService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DataModel>>(
      future: dataService.readData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(
            home: Scaffold(
              appBar: AppBar(
                title: Text('Main Activity'),
              ),
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return MaterialApp(
            home: Scaffold(
              appBar: AppBar(
                title: Text('Main Activity'),
              ),
              body: Center(
                child: Text('Error loading data.'),
              ),
            ),
          );
        } else {
          final dataList = snapshot.data!;

          final arguments = AgeGroupArguments(
            dataList: dataList,
            forChildOrAdult: "0",
            ageGroup: "Adult",
          );

          return MaterialApp(
            theme: myTheme, // Apply your custom theme
            home: MainPage(dataList: dataList, arguments: arguments),
            routes: {
              '/ageGroup': (context) => AgeGroupActivity(dataList: dataList, arguments: arguments),
              '/group2': (context) => Group2Activity(dataList: dataList, arguments: arguments),
            },
          );
        }
      },
    );
  }
}

class MainPage extends StatefulWidget {
  final List<DataModel> dataList;
  final AgeGroupArguments arguments;

  MainPage({required this.dataList, required this.arguments});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DataList(dataList: widget.dataList),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Научиться',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.warning),
            label: 'Экстренная ситуация',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb),
            label: 'Это интересно',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}