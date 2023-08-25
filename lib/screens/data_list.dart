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
    return Scaffold(
      appBar: AppBar(
        title: isSearching
            ? TextField(
          controller: _searchController,
          onChanged: _filterData,
          decoration: InputDecoration(
            hintText: 'Search...',
          ),
        )
            : Text('Data List',        style: Theme.of(context).textTheme.bodyText2,),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              setState(() {
                isSearching = !isSearching;
              });
            },
          ),
        ],
      ),
      body: isSearching
          ? ListView.builder(
        itemCount: filteredList.length,
        itemBuilder: (context, index) {
          final data = filteredList[index];
          return ListTile(
            title: Text(data.name,        style: Theme.of(context).textTheme.bodyText2,),
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
      )
          : Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: FloatingActionButton.extended(
                    onPressed: () {
                      Navigator.pushNamed(context, '/ageGroup', arguments: "Child");
                    },
                    label: Text('Child'),
                    icon: Icon(Icons.person),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: FloatingActionButton.extended(
                    onPressed: () {
                      Navigator.pushNamed(context, '/group2', arguments: "Adult");
                    },
                    label: Text('Adult'),
                    icon: Icon(Icons.group),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
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