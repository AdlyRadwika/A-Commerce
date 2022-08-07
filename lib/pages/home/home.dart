import 'package:flutter/material.dart';

import 'package:project_dicoding/data/model/fakestore_model.dart';
import 'package:project_dicoding/data/source/remote_source.dart';

import 'package:project_dicoding/pages/home/widgets/category_widget.dart';
import 'package:project_dicoding/pages/home/widgets/product_image_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<FakestoreModel>? fakestoreModel;
  List<String>? fakestoreCategories;
  int selectedCategoryPosition = -1;

  @override
  void initState() {
    super.initState();
    getProductsData();
    getCategoriesData();
  }

  getProductsData() async {
    fakestoreModel = await RemoteSource().getProducts();
    if (fakestoreModel != null) {
      setState(() {});
    } else if (fakestoreModel == null) {
      debugPrint("Error");
    }
  }

  getCategoryProductData(String category) async {
    fakestoreModel = await RemoteSource().getCategoryProducts(category);
    if (fakestoreModel != null) {
      setState(() {});
    } else if (fakestoreModel == null) {
      debugPrint("Error");
    }
  }

  getCategoriesData() async {
    fakestoreCategories = await RemoteSource().getCategories();
    if (fakestoreCategories != null) {
      setState(() {});
    } else if (fakestoreCategories == null) {
      debugPrint("Error");
    }
  }

  Widget _buildCategoryList(){
    return Container(
      color: Colors.black,
      height: 60,
      child: ListView.builder(
        itemBuilder: (context, index) {
          String categoryList = fakestoreCategories![index];
          return Container(
            color: Colors.black,
            child: Row(
              children: [
                const SizedBox(width: 4,),
                CategoryWidget(
                  itemPosition: index,
                  isSelected: selectedCategoryPosition == index,
                  fakestoreCategories: categoryList,
                  onAreaClicked: (itemPosition) {
                    selectedCategoryPosition = itemPosition;
                    setState(() {});
                    getCategoryProductData(categoryList.toString());
                  },
                ),
                const SizedBox(width: 4,),
              ],
            ),
          );
        },
        itemCount: fakestoreCategories != null ? fakestoreCategories!.length : 0,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  Widget _buildProductImages(){
    return fakestoreModel != null
    ? GridView.builder(
      shrinkWrap: true,
      primary: false,
      padding: EdgeInsets.zero,
      scrollDirection: Axis.vertical,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (_, index) {
        final FakestoreModel fakestoreModelList = fakestoreModel![index];
        return ProductContentsWidget(
          product: fakestoreModelList,
        );
      },
      itemCount: fakestoreModel != null? fakestoreModel!.length : 0,
    )
    : const Center(child: CircularProgressIndicator());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "A-Commerce's Catalogue",
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCategoryList(),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                getProductsData();
                getCategoriesData();
                selectedCategoryPosition = -1;
              },
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: const AlwaysScrollableScrollPhysics(),
                child: _buildProductImages()
              ),
            ),
          ),
        ],
      ),
    );
  }
}