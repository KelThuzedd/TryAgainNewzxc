import 'package:flutter/material.dart';
import 'package:tryagainnew/screens/data_list.dart';
import '../models/data_model.dart'; // Import DataModel
import '../screens/age_group_activity.dart';

class Group2Activity extends StatelessWidget {
  final List<DataModel> dataList;

  Group2Activity({required this.dataList});

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
                _navigateToAgeGroupActivity(context, "ForAdult", "Child");
              },
              child: Text('Помощь оказывается ребенку'),
            ),
            ElevatedButton(
              onPressed: () {
                _navigateToAgeGroupActivity(context, "ForAdult", "Adult");
              },
              child: Text('Помощь оказывается взрослому'),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToAgeGroupActivity(BuildContext context, String forChildOrAdult, String ageGroup) {
    print("Navigating to AgeGroupActivity with parameters: $forChildOrAdult, $ageGroup");

    // Выводим содержимое dataList в консоль
    print("Data in dataList:");
    dataList.forEach((data) {
      print("forChild: ${data.forChild} ageGroup: ${data.ageGroup}");
      print("forChild: ${data.forChild}");
      print("Filtered data count: ${forChildOrAdult}");
      print("Filtered data count: ${ageGroup}");


    });

    final filteredData = dataList.where((data) =>  data.ageGroup == ageGroup).toList();
    //data.forChild == forChildOrAdult &&
    print("Filtered data count: ${filteredData.length}");
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AgeGroupActivity(dataList: filteredData),
      ),
    );
  }
}