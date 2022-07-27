import 'package:flutter/material.dart';
import 'package:project_dicoding/pages/home/home.dart';

const homePage = "home_page";

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case homePage:
      return MaterialPageRoute(builder: (context) => const HomePage());
    default:
      throw("Page not found");
  }
}