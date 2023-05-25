import 'package:apigiris/UIhelper/constant/ui_colors.dart';
import 'package:flutter/material.dart';


class ListOfCategory extends StatelessWidget {
  const ListOfCategory({
    Key? key,
    required this.categories,
    required this.onCategorySelected,
  }) : super(key: key);

  final List categories;
  final Function(String) onCategorySelected;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          categories.length,
              (index) => GestureDetector(
            onTap: () {
              onCategorySelected(categories[index]);
            },
            child: Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: UIColors.appBarBackgroundColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "${categories[index]}",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}