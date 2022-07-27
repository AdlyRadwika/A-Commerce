import 'package:flutter/material.dart';
import 'package:project_dicoding/data/model/fakestore_model.dart';
import 'package:project_dicoding/data/source/remote_source.dart';
import 'package:project_dicoding/pages/home/category_widget.dart';

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
    return SafeArea(
      top: true,
      child: Text(
        "Choose our products!",
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
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
              SizedBox(width: 8,),
            ],
          );
        },
        itemCount: fakestoreCategories != null ? fakestoreCategories!.length : 0,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  Widget _buildAllContents(){
    return fakestoreModel != null
    ? GridView.builder(
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (_, index) {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ],
                color: Colors.black12,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.network(
                  fakestoreModel![index].image,
                  fit: BoxFit.fill,
                ),
              ),
          ),
        );
      },
      itemCount: fakestoreModel != null? fakestoreModel!.length : 0,
    )
    : const Center(child: RefreshProgressIndicator());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeading(),
              _buildCategoryList(),
              SizedBox(height: 8,),
              RefreshIndicator(
                onRefresh: () async {
                  getProductsData();
                  getCategoriesData();
                  selectedCategoryPosition = -1;
                },
                child: SizedBox(
                  height: (MediaQuery.of(context).size.height)-150,
                  child: _buildAllContents(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
