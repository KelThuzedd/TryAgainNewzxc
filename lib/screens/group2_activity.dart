import 'package:flutter/material.dart';
import '../models/data_model.dart';
import '../screens/age_group_activity.dart';

class Group2Activity extends StatelessWidget {
  final List<DataModel> dataList;
  final AgeGroupArguments arguments;

  Group2Activity({required this.dataList, required this.arguments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Group 2 Activity'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: FloatingActionButton.extended(
                  onPressed: () {
                    final newArguments = AgeGroupArguments(
                      dataList: arguments.dataList,
                      forChildOrAdult: '1',
                      ageGroup: "Child",
                    );
                    _navigateToAgeGroupActivity(context, newArguments);
                  },
                  label: Text('For Childs'),
                  icon: Icon(Icons.person),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: FloatingActionButton.extended(
                  onPressed: () {
                    final newArguments = AgeGroupArguments(
                      dataList: arguments.dataList,
                      forChildOrAdult: '1',
                      ageGroup: "Adult",
                    );
                    _navigateToAgeGroupActivity(context, newArguments);
                  },
                  label: Text('For Adults'),
                  icon: Icon(Icons.group),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFF517398), // Установите нужный цвет фона здесь
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              color: Colors.white, // Установите цвет иконки здесь

              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToAgeGroupActivity(BuildContext context, AgeGroupArguments newArguments) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AgeGroupActivity(
          dataList: arguments.dataList,
          arguments: newArguments,
        ),
      ),
    );
  }
}