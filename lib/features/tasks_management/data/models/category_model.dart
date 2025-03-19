class CategoryModel {
  String? categoryName;
  int? completeTasksInToday;
  int? allTasksToday;
  String? categoryImage;
  String? categoryId;
  static const String collectionName = "Categories";

  CategoryModel(
      {this.categoryId, this.categoryName, this.categoryImage,this.allTasksToday,this.completeTasksInToday});

  CategoryModel.fromFireStore(Map<String, dynamic>?data) {
    allTasksToday = data?["allTasksToday"];
    completeTasksInToday = data?["completeTasksInToday"];
    categoryImage = data?["categoryImage"];
    categoryName = data?["categoryName"];
    categoryId = data?["categoryId"];
  }

  Map<String, dynamic> toFireStore() {
    return {
      "allTasksToday":allTasksToday,
      "completeTasksInToday":completeTasksInToday,
      "categoryName": categoryName,
      'categoryImage': categoryImage,
      "categoryId": categoryId,
    };
  }
}