import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_dicoding/data/model/fakestore_model.dart';
import 'package:project_dicoding/data/source/remote_source.dart';
import 'package:project_dicoding/pages/transaction/buyer_info_widget.dart';
import 'package:project_dicoding/pages/completion/completion.dart';

class TransactionPage extends StatefulWidget {
  final FakestoreModel product;

  const TransactionPage({Key? key, required this.product}) : super(key: key);

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  List<Object>? fakestoreModel;
  int count = 1;
  double total = 0;

  increaseQuantity(double productPrice){
    count++;
    total = productPrice * count;
    setState(() {});
  }

  decreaseQuantity(double productPrice){
    if (count > 1) {
      count--;
      total = (productPrice * (count + 1) ) - productPrice;
      setState(() {});
    } else {
      count = 1;
      total = productPrice;
      setState(() {});
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("You can't decrease the quantity"),
      ));
    }
  }

  updateProductData(int productID, FakestoreModel product) async {
    fakestoreModel = await RemoteSource().updateProduct(productID, product);
  }

  @override
  void initState() {
    widget.product.price += 10;
    total = widget.product.price;
    super.initState();
  }

  Widget _buildProductPicked(String productTitle) {
    return Row(
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
                  (widget.product.price - 10)
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
    );
  }

  Widget _buildQuantityButton(double productPrice) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Quantity",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8,),
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
                  decreaseQuantity(productPrice);
                  setState(() {});
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
                  increaseQuantity(productPrice);
                  setState(() {});
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
    );
  }

  Widget _buildTotalSection(double productPrice) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Total",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              NumberFormat.simpleCurrency().format(
                  total
              ),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Product(s)",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text("+ ${NumberFormat.simpleCurrency().format(
                productPrice - 10
            )}",
              style: const TextStyle(
                  fontSize: 16
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "Fee",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              r"+ $10",
              style: TextStyle(
                  fontSize: 16
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Quantity",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              "+ $count",
              style: const TextStyle(
                  fontSize: 16
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var productTitle = widget.product.title;
    double productPrice = widget.product.price;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Buy Now",
        ),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProductPicked(productTitle),
            const SizedBox(height: 12,),
            const BuyerInfo(
              title: "Shipping to",
              icon: "home",
              iconLabel: "My House",
              iconDetail: "St. Somewher...",
              userName: "John Doe",
              userDetail: "0821xxxxxxxx"),
            const SizedBox(height: 12,),
            const BuyerInfo(
                title: "Payment",
                icon: "credit card",
                iconLabel: "Credit Card",
                iconDetail: "NewbieCard",
                userName: "John D. M.",
                userDetail: "1234-xxxx-xxxx-xxxx"),
            const SizedBox(height: 12,),
            _buildQuantityButton(productPrice),
            const SizedBox(height: 12,),
            _buildTotalSection(productPrice),
            const SizedBox(height: 24,),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        onPressed: () {

          widget.product.price = total;
          updateProductData(widget.product.id, widget.product);

          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => CompletionPage(product: widget.product,)), (route) => false);
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
      ),
    );
  }
}