import 'package:flutter/material.dart';

import 'package:project_dicoding/data/model/fakestore_model.dart';

import 'package:project_dicoding/pages/route.dart' as route;

class ProductContentsWidget extends StatelessWidget {
  final FakestoreModel product;

  const ProductContentsWidget({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, route.productDetailPage, arguments: product);
      },
      borderRadius: BorderRadius.circular(25),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Container(
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(0, 1),
              ),
            ],
            color: Colors.black12,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.network(
              product.image,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
