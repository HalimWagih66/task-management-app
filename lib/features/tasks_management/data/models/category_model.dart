class CategoryModel {
  String? categoryName;
  String? categoryImage;
  String? categoryId;
  static const String collectionName = "Categories";

  CategoryModel(
      {this.categoryId, this.categoryName, this.categoryImage});

  CategoryModel.fromFireStore(Map<String, dynamic>?data) {
    categoryImage = data?["categoryImage"];
    categoryName = data?["categoryName"];
    categoryId = data?["categoryId"];
  }

  Map<String, dynamic> toFireStore() {
    return {
      "categoryName": categoryName,
      'categoryImage': categoryImage,
      "categoryId": categoryId,
    };
  }
}