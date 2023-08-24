import 'package:flutter/material.dart';
import 'detail_activity.dart';
import '../models/data_model.dart';

class DataList extends StatefulWidget {
  final List<DataModel> dataList;

  DataList({required this.dataList});

  @override
  _DataListState createState() => _DataListState();
}

class _DataListState extends State<DataList> {
  late TextEditingController _searchController;
  late List<DataModel> filteredList;
  bool isSearching = false;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    filteredList = widget.dataList;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          automaticallyImplyLeading: false,
          title: TextField(
            controller: _searchController,
            onChanged: _filterData,
            onTap: () {
              setState(() {
                isSearching = true;
              });
            },
            onSubmitted: (value) {
              setState(() {
                isSearching = false;
              });
            },
            decoration: InputDecoration(
              hintText: 'Search...',
            ),
          ),
          actions: [
            if (isSearching)
              IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  _searchController.clear();
                  _filterData('');
                  setState(() {
                    isSearching = false;
                  });
                },
              ),
          ],
        ),
        Visibility(
          visible: !isSearching,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/group2',arguments: "Adult");
                  },
                  child: Icon(Icons.group),
                ),
                SizedBox(height: 16.0),
                FloatingActionButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/ageGroup',arguments: "Child");
                  },
                  child: Icon(Icons.person),
                ),
              ],
            ),
          ),
        ),
        if (isSearching)
          Expanded(
            child: ListView.builder(
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                final data = filteredList[index];
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
          ),
      ],
    );
  }

  void _filterData(String query) {
    setState(() {
      filteredList = widget.dataList.where((data) {
        final nameLower = data.name.toLowerCase();
        final queryLower = query.toLowerCase();
        return nameLower.contains(queryLower);
      }).toList();
    });
  }
}
