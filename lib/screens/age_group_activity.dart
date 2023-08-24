import 'package:flutter/material.dart';
import '../models/data_model.dart';
import '../screens/detail_activity.dart'; // Import DetailActivity
import '../screens/group2_activity.dart'; // Import Group2Activity and AgeGroupArguments

class AgeGroupActivity extends StatelessWidget {
  final List<DataModel> dataList;
  final AgeGroupArguments arguments;

  AgeGroupActivity({required this.dataList, required this.arguments}) {
    print('AgeGroupActivity: Constructor');
    print('AgeGroupActivity: dataList length: ${dataList.length}');
  }

  @override
  Widget build(BuildContext context) {

    final String ageGroupArgument = arguments.ageGroup;
    final  forChildOrAdultArgument = arguments.forChildOrAdult;

    print('AgeGroupActivity: Build');
    print('AgeGroupActivity: dataList length: ${dataList.length}');
    dataList.forEach((data) {
      print('Data forChild: ${data.forChild}');
    });
    final filteredData = dataList.where(
            (data) =>
        int.parse(data.forChild) == int.parse(forChildOrAdultArgument)
                &&    data.ageGroup == ageGroupArgument

    ).toList();

    print('AgeGroupActivity: filteredData length: ${filteredData.length}');
    print('AgeGroupActivity: dataList ageGroupArgument: ${ageGroupArgument}');
    print('AgeGroupActivity: dataList forChildOrAdultArgument: ${forChildOrAdultArgument}');
    print('Type of data.forChild: ${dataList[0].forChild.runtimeType}');
    print('Type of forChildOrAdultArgument: ${forChildOrAdultArgument.runtimeType}');


    return Scaffold(
      appBar: AppBar(
        title: Text('Age Group Activity'),
      ),
      body: ListView.builder(
        itemCount: filteredData.length,
        itemBuilder: (context, index) {
          final data = filteredData[index];
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