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
    final forChildOrAdultArgument = arguments.forChildOrAdult;

    final filteredData = dataList.where(
          (data) =>
      int.parse(data.forChild) == int.parse(forChildOrAdultArgument) &&
          data.ageGroup == ageGroupArgument,
    ).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Age Group Activity'),
      ),
      body: ListView.builder(

        itemCount: filteredData.length,
        itemBuilder: (context, index) {
          final data = filteredData[index];
          return ListTile(
            title: Text(data.name,style: Theme.of(context).textTheme.bodyText2,),
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
}