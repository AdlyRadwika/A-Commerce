import 'package:flutter/material.dart';
import 'package:project_dicoding/data/model/fakestore_model.dart';
import 'package:project_dicoding/pages/route.dart' as route;

class ProductContentsWidget extends StatelessWidget {
  final List<FakestoreModel>? fakestoreModel;
  final int index;

  const ProductContentsWidget({Key? key, required this.fakestoreModel, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(route.productDetailPage);
      },
      borderRadius: BorderRadius.circular(25),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Container(
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ],
            color: Colors.black12,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.network(
              fakestoreModel![index].image,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
