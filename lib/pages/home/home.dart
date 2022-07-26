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
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getProductsData();
  }

  getProductsData() async {
    fakestoreModel = await RemoteSource().getProducts();
    if (fakestoreModel != null) {
      setState(() {
        isLoaded = true;
      });
    } else if (fakestoreModel == null) {
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
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.black87,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: Text(
              "All",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(width: 8,),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.black12,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: Text(
              "Electronics",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),
            ),
          ),
          SizedBox(width: 8,),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.black12,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: Text(
              "Men's Clothing",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),
            ),
          ),
          SizedBox(width: 8,),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.black12,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: Text(
              "Women's Clothing",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAllContents(){
    return ListView.builder(
      itemCount: fakestoreModel != null? fakestoreModel!.length : 0,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.black12,
                    ),
                    child: Text('a'),
                  ),
                ),
                SizedBox(width: 8,),
                Flexible(
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.black12,
                    ),
                    child: fakestoreModel != null? Image.network(fakestoreModel![index].image) : Text("Data is empty")
                  ),
                ),
              ],
            ),
            SizedBox(height: 8,),
          ],
        );
      },
    );
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
              SizedBox(height: 18,),
              SizedBox(height: 150, child: _buildAllContents()),
            ],
          ),
        ),
      ),
    );
  }
}
