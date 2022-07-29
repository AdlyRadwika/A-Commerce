import 'package:flutter/material.dart';

class BuyNowButton extends StatelessWidget {
  const BuyNowButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {

      },
      style: ElevatedButton.styleFrom(
        primary: Colors.black87,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25)
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
          "Buy this product",
        ),
      ),
    );
  }
}
