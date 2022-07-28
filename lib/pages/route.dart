import 'package:flutter/material.dart';
import 'package:project_dicoding/pages/home/home.dart';
import 'package:project_dicoding/pages/product detail/product_detail.dart';

const homePage = "home_page";
const productDetailPage = "product_detail_page";

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case homePage:
      return MaterialPageRoute(builder: (context) => const HomePage());
    case productDetailPage:
      return MaterialPageRoute(builder: (context) => const ProductDetailPage());
    default:
      throw("Page not found");
  }
}