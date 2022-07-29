import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_dicoding/data/model/fakestore_model.dart';

class TransactionPage extends StatefulWidget {
  final FakestoreModel product;

  const TransactionPage({Key? key, required this.product}) : super(key: key);

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  int count = 1;

  void increaseQuantity(){
    count++;
    setState(() {});
  }

  void decreaseQuantity(){
    if (count > 1) {
      count--;
      setState(() {});
    } else {
      count = 1;
      setState(() {});
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("You can't decrease the quantity"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    var productTitle = widget.product.title;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Buy Now"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: const Offset(0, 1),
                      ),
                    ]
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      widget.product.image,
                      height: 120,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 8,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productTitle.replaceRange(8, productTitle.length, '...'),
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(height: 4,),
                    Text(
                      NumberFormat.simpleCurrency().format(
                        widget.product.price
                      ),
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Quantity",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4,),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.black,
                      width: 1
                    )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {
                          decreaseQuantity();
                        },
                        icon: const Icon(
                          Icons.remove,
                        ),
                        iconSize: 32,
                      ),
                      Text(
                        count.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          increaseQuantity();
                        },
                        icon: const Icon(
                          Icons.add,
                        ),
                        iconSize: 32,
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 12,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Shipping to",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4,),
                Container(
                  padding: const EdgeInsets.all(8),
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                        color: Colors.black,
                        width: 1
                    )
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("One"),
                          Text("Three"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Two"),
                          Text("Four"),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}