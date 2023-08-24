// lib/models/data_model.dart

class DataModel {
  final String id;
  final String name;
  final String description;
  final String ageGroup;
  final String imageName;
  final String forChild;

  DataModel({
    required this.id,
    required this.name,
    required this.description,
    required this.ageGroup,
    required this.imageName,
    required this.forChild,
  });
}
