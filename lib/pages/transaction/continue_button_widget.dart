import 'package:flutter/material.dart';
import 'package:project_dicoding/data/model/fakestore_model.dart';
import 'package:project_dicoding/pages/completion/completion.dart';

class ContinueButton extends StatelessWidget {
  final FakestoreModel product;

  const ContinueButton({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => CompletionPage(product: product))
        );
        // Navigator.of(context).pushAndRemoveUntil(
        //   MaterialPageRoute(builder: (context) => CompletionPage(product: product,)), (route) => false);
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
        "Continue",
        ),
      ),
    );
  }
}
