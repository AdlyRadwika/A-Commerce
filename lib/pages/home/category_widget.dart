import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final Function(int position) onAreaClicked;
  final int itemPosition;
  final String fakestoreCategories;
  final bool isSelected;

  const CategoryWidget({Key? key, required this.onAreaClicked, required this.itemPosition, required this.fakestoreCategories, required this.isSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onAreaClicked(itemPosition);
      },
      borderRadius: BorderRadius.circular(16),
      child: isSelected
          ? Container(
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
          color: Colors.black87,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Text(
          fakestoreCategories,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      )
          : Container(
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
          color: Colors.black12,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Text(
          fakestoreCategories,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
