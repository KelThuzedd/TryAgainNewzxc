import 'package:flutter/material.dart';
import 'package:tryagainnew/screens/data_list.dart';
import '../models/data_model.dart'; // Import DataModel
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                final newArguments = AgeGroupArguments(
                  dataList: arguments.dataList,
                  forChildOrAdult: '1',
                  ageGroup: "Child",
                );
                _navigateToAgeGroupActivity(context, newArguments);
              },
              child: Text('Помощь оказывается ребенку'),
            ),
            ElevatedButton(
              onPressed: () {
                final newArguments = AgeGroupArguments(
                  dataList: arguments.dataList,
                  forChildOrAdult: '1',
                  ageGroup: "Adult",
                );
                _navigateToAgeGroupActivity(context, newArguments);
              },
              child: Text('Помощь оказывается взрослому'),
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
  }}
