import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_dicoding/data/model/fakestore_model.dart';

class RemoteSource {
  Future<List<FakestoreModel>?> getProducts() async {
    var client = http.Client();

    var url = Uri.parse('https://fakestoreapi.com/products/');
    var response = await client.get(url);
    if(response.statusCode == 200){
      var json = response.body;
      var result = (jsonDecode(json) as List<dynamic>).map((e) => FakestoreModel.fromJson(e)).toList();
      return result;
    }
    return [];
  }

  Future<List<FakestoreModel>?> getCategoryProducts(String categoryName) async {
    var client = http.Client();

    var url = Uri.parse("https://fakestoreapi.com/products/category/$categoryName");
    var response = await client.get(url);
    if(response.statusCode == 200){
      var json = response.body;
      var result = (jsonDecode(json) as List<dynamic>).map((e) => FakestoreModel.fromJson(e)).toList();
      return result;
    }
    return [];
  }

  Future<List<String>?> getCategories() async {
    var client = http.Client();

    var url = Uri.parse('https://fakestoreapi.com/products/categories');
    var response = await client.get(url);
    if(response.statusCode == 200){
      var json = response.body;
      var result = fakestoreCategoryFromJson(json);
      return result;
    }
    return [];
  }

}
