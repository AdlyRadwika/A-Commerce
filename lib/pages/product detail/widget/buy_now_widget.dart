import 'package:flutter/material.dart';

import 'package:project_dicoding/data/model/fakestore_model.dart';

import 'package:project_dicoding/pages/route.dart' as route;

class BuyNowButton extends StatelessWidget {
  final FakestoreModel product;

  const BuyNowButton({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, route.transactionPage, arguments: product);
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.black,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
        ),
        textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          "Buy Now",
        ),
      ),
    );
  }
}
