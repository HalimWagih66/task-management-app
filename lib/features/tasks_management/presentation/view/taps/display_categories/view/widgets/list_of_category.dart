import 'package:flutter/material.dart';
import '../../../../../../data/models/category_model.dart';
import 'category_item.dart';

class ListOfCategory extends StatelessWidget {
  const ListOfCategory({
    super.key, required this.items,
  });
  final List<CategoryModel> items;
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(itemBuilder: (context, index) => CategoryItem(categoryModel: items[index]),itemCount: items.length);
  }
}
