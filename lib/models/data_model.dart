// lib/models/data_model.dart

class DataModel {
  final String id;
  final String name;
  final String description;
  final String ageGroup;
  final String imageName;
  final String forChild;
  final String voicetext;

  DataModel({
    required this.id,
    required this.name,
    required this.description,
    required this.ageGroup,
    required this.imageName,
    required this.forChild,
    required this.voicetext,
  });
}
class AgeGroupArguments {
  final List<DataModel> dataList;
  final String forChildOrAdult;
  final String ageGroup;

  AgeGroupArguments({
    required this.dataList,
    required this.forChildOrAdult,
    required this.ageGroup,
  });
}
