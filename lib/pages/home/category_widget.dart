import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final Function(int position) onAreaClicked;
  final int itemPosition;
  final List<String>? fakestoreCategories;
  final bool isSelected;

  const CategoryWidget({Key? key, required this.onAreaClicked, required this.itemPosition, this.fakestoreCategories, required this.isSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onAreaClicked(itemPosition);
      },
      borderRadius: BorderRadius.circular(16),
      child: isSelected
          ? Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.black87,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Text(
          fakestoreCategories![itemPosition].toString(),
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      )
          : Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.black12,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Text(
          fakestoreCategories![itemPosition].toString(),
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
    ;
  }
}
