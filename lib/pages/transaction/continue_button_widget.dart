import 'package:flutter/material.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        // },));
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
