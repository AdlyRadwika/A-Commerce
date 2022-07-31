import 'package:flutter/material.dart';
import 'package:project_dicoding/data/model/fakestore_model.dart';
import 'package:project_dicoding/pages/route.dart' as route;


class CompletionPage extends StatelessWidget {
  final FakestoreModel product;

  const CompletionPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            Text(
              product.id.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14
              ),
            ),
            Text(
              product.price.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14
              ),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(route.homePage, (route) => false);
              },
              child: const Text("Continue"))
          ],
        ),
      ),
    );
  }
}
