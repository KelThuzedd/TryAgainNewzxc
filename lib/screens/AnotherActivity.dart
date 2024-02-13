import 'package:flutter/material.dart';
import '../models/data_model.dart';
import '../screens/detail_activity.dart';
import '../models/data_model.dart';

class AnotherActivity extends StatelessWidget {
  final List<DataModel> dataList;

  AnotherActivity({required this.dataList}) {
    print('AnotherActivity: Constructor');
    print('AnotherActivity: dataList length: ${dataList.length}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Age Group Activity'),
      ),
      body: ListView(
        children: [
          ElevatedButton.icon(
            onPressed: () {
              final data = dataList[15];
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailActivity(data: data),
                ),
              );
            },
            icon: Container(
              width: 100, // ������ �����������
              height: 100, // ������ �����������
              child: Image.asset('111.jpg'), // ���� � ������ �����������
            ),            label: Text('Button 1'), // �����, ������� ����� ������������ ����� � ������������
          ),
          ElevatedButton.icon(
            onPressed: () {
              final data = dataList[31];
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailActivity(data: data),
                ),
              );
              // ��� ��� ��������� ������ 2
            },
            icon: Container(
              width: 100, // ������ �����������
              height: 100, // ������ �����������
              child: Image.asset('222.jpg'), // ���� � ������ �����������
            ),            label: Text('Button 2'), // ����� ��� ������ ������
          ),
          ElevatedButton.icon(
            onPressed: () {
              final data = dataList[31];
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailActivity(data: data),
                ),
              );
              // ��� ��� ��������� ������ 3
            },
            icon: Container(
              width: 100, // ������ �����������
              height: 100, // ������ �����������
              child: Image.asset('333.jpg'), // ���� � ������ �����������
            ),            label: Text('Button 3'), // ����� ��� ������� ������
          ),

        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFF517398),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              color: Colors.white,
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