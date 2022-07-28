import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_dicoding/data/model/fakestore_model.dart';
import 'package:project_dicoding/pages/route.dart' as route;

class ProductDetailPage extends StatefulWidget {
  final FakestoreModel product;

  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        color: Colors.white
                    ),
                    child: Image.network(
                      widget.product.image,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 65,
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, route.homePage);
                            },
                            icon: const Icon(
                              Icons.arrow_back_rounded,
                              color: Colors.white,
                            ),
                            iconSize: 35,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 65,
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: () {
                              isSelected = true;
                              setState(() {});
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("This product has been added to favorite")));
                            },
                            icon: isSelected
                              ? const Icon(
                                Icons.favorite_rounded,
                                color: Colors.white,
                              )
                              : const Icon(
                                  Icons.favorite_border_rounded,
                                  color: Colors.white,
                                ),
                            iconSize: 35,
                          ),
                        ),
                      ),
                    ],
                  ),
                ]
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height - (MediaQuery.of(context).size.height * 0.3),
                    color: Colors.white,
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                        color: Colors.black12,
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 85,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.black87,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Icon(
                                      Icons.star_border,
                                      size: 24,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      widget.product.rating.rate.toString(),
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                NumberFormat.simpleCurrency().format(
                                    widget.product.price
                                ),
                                textAlign: TextAlign.end,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 32,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          Text(
                            widget.product.title,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            widget.product.description,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ],
                    ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
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
      ),
    );
  }
}