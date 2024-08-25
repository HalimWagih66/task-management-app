class CategoryModel {
  String? categoryName;
  String? categoryImage;
  int? numberTasks;
  String? categoryId;
  int? completedTasks;
  static const String collectionName = "Categories";

  CategoryModel(
      {this.completedTasks,this.categoryId, this.categoryName, this.categoryImage, this.numberTasks});

  CategoryModel.fromFireStore(Map<String, dynamic>?data) {
    categoryImage = data?["categoryImage"];
    categoryName = data?["categoryName"];
    numberTasks = data?["numberTasks"];
    categoryId = data?["categoryId"];
    completedTasks = data?["completedTasks"];
  }

  Map<String, dynamic> toFireStore() {
    return {
      "completedTasks":completedTasks,
      "categoryName": categoryName,
      'categoryImage': categoryImage,
      "categoryId": categoryId,
      'numberTasks': numberTasks
    };
  }
}