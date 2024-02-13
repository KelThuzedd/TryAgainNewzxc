import 'package:flutter/services.dart';
import 'dart:async';

import '../models/data_model.dart';

class DataService {
  Future<List<DataModel>> readData() async {
    final dataList = <DataModel>[];

    final lines = await rootBundle.loadString('assets/data.txt');
    final dataLines = lines.split('\n');
    for (final line in dataLines) {
      final columns = line.split('///');
      if (columns.length >= 6) {
        final data = DataModel(
          id: columns[0],
          name: columns[1],
          description: columns[2],
          ageGroup: columns[3],
          imageName: columns[4],
          forChild: columns[5],
          voicetext: columns[6],

        );
        // Выводим содержимое каждой колонки
        print('ID: ${data.id}');
        print('Name: ${data.name}');
        print('Description: ${data.description}');
        print('Age Group: ${data.ageGroup}');
        print('Image Name: ${data.imageName}');
        print('For Child: ${data.forChild}');
        print('Voice Text: ${data.voicetext}');
        dataList.add(data);
      }
    }

    return dataList;

  }
}
