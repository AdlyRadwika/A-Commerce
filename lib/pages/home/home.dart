import 'package:flutter/material.dart';
import 'package:project_dicoding/data/model/fakestore_model.dart';
import 'package:project_dicoding/data/source/remote_source.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<FakestoreModel>? fakestoreModel;
  List<String>? fakestoreCategories;
  bool _isSelected = false;
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
          return Row(
            children: [
              InkWell(
                onTap: () {
                  getCategoryProductData(fakestoreCategories![index].toString());
                  selectedCategoryPosition = index;
                  _isSelected = (selectedCategoryPosition == index);
                  setState(() {});
                },
                borderRadius: BorderRadius.circular(16),
                child: _isSelected
                ? Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  child: Text(
                    fakestoreCategories![index].toString(),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                )
                : Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  child: Text(
                    fakestoreCategories![index].toString(),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
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
              SizedBox(
                height: (MediaQuery.of(context).size.height)-150,
                child: _buildAllContents(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
