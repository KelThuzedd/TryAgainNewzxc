import 'package:flutter/material.dart';
import '../models/data_model.dart';

Future<List<DataModel>> readData(BuildContext context) async {
  final dataList = <DataModel>[];

  final lines = await DefaultAssetBundle.of(context).loadString('assets/data.txt');
  final dataLines = lines.split('\n');
  for (final line in dataLines) {
    final columns = line.split(';');
    if (columns.length >= 6) {
      final data = DataModel(
        id: columns[0],
        name: columns[1],
        description: columns[2],
        ageGroup: columns[3],
        imageName: columns[4],
        forChild: columns[5],
      );
      dataList.add(data);
    }
  }

  return dataList;
}