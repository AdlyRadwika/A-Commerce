import 'package:flutter/material.dart';
import 'package:project_dicoding/data/model/fakestore_model.dart';
import 'package:project_dicoding/pages/route.dart' as route;

class ProductDetailPage extends StatelessWidget {
  final List<FakestoreModel>? fakestoreModel;
  final int index;

  const ProductDetailPage({Key? key, this.fakestoreModel, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: OutlinedButton(
        onPressed: () {
          Navigator.of(context).pushNamed(route.homePage);
        },
        child: const Text("Back to homekkjkk")),
    );
  }
}
