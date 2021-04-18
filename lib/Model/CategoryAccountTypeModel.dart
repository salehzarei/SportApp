class CategoryAccountTypeModel {
  String title;
  int id;
  int level;

  CategoryAccountTypeModel({this.title, this.id, this.level});

  CategoryAccountTypeModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    id = json['id'];
    level = json['level'];
  }
}
