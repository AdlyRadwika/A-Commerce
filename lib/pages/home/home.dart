import 'package:flutter/material.dart';
import 'package:project_dicoding/data/model/fakestore_model.dart';
import 'package:project_dicoding/data/source/remote_source.dart';
import 'package:project_dicoding/pages/home/category_widget.dart';
import 'package:project_dicoding/pages/home/product_image_widget.dart';

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

  Widget _buildHeading(){
    return const SafeArea(
      top: true,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          "A-Commerce's Catalogue",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryList(){
    return SizedBox(
      height: 45,
      child: ListView.builder(
        itemBuilder: (context, index) {
          String categoryList = fakestoreCategories![index];
          return Row(
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
      padding: EdgeInsets.zero,
      scrollDirection: Axis.vertical,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (_, index) {
        return ProductContentsWidget(
          fakestoreModel: fakestoreModel,
          index: index,
        );
      },
      itemCount: fakestoreModel != null? fakestoreModel!.length : 0,
    )
    : const Center(child: RefreshProgressIndicator());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeading(),
          _buildCategoryList(),
          const SizedBox(height: 8,),
          RefreshIndicator(
            onRefresh: () async {
              getProductsData();
              getCategoriesData();
              selectedCategoryPosition = -1;
            },
            child: SizedBox(
              height: (MediaQuery.of(context).size.height)-150,
              child: _buildProductImages(),
            ),
          ),
        ],
      ),
    );
  }
}