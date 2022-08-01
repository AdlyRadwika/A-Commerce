import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_dicoding/data/model/fakestore_model.dart';
import 'package:project_dicoding/pages/route.dart' as route;


class CompletionPage extends StatelessWidget {
  final FakestoreModel product;
  final int quantity;


  const CompletionPage({Key? key, required this.product, required this.quantity}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    String productTitle = product.title;

    Widget _buildSuccessText() {
      return const Text(
        "Payment Success!",
        style: TextStyle(
          color: Colors.black,
          fontSize: 32,
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
      );
    }

    Widget _buildBillContainer() {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          children: [
            Text(
              "Order#10${product.id.toString()}",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              DateFormat.jm().add_yMMMMd().format(DateTime.now()),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Payment Details",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 4,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Product(s)",
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      NumberFormat.simpleCurrency().format(
                          product.price
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Fee",
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      r"$10",
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total",
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      NumberFormat.simpleCurrency().format(
                          (product.price + 10)
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Product Details",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 4,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Name",
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      productTitle.replaceRange(12, productTitle.length, '...'),
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Category",
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      product.category,
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Quantity",
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      quantity.toString(),
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget _buildInfoText() {
      return const Text(
        "The item you purchased would be sent within 24 hours from now and it would arrive a few days from now.",
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w300,
        ),
        textAlign: TextAlign.center,
      );
    }

    Widget _buildContinueButton() {
      return ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamedAndRemoveUntil(route.homePage, (route) => false);
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

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SafeArea(
          top: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSuccessText(),
              const SizedBox(height: 8,),
              _buildBillContainer(),
              const SizedBox(height: 16,),
              _buildInfoText(),
              const SizedBox(height: 32,),
              _buildContinueButton()
            ],
          ),
        ),
      ),
    );
  }
}
