import 'package:flutter/material.dart';
import 'package:project_dicoding/pages/product%20detail/product_detail.dart';

import '../data/model/fakestore_model.dart';

import 'package:project_dicoding/pages/completion/completion.dart';
import 'package:project_dicoding/pages/home/home.dart';
import 'package:project_dicoding/pages/transaction/transaction.dart';

const homePage = "home_page";
const transactionPage = "transaction_page";
const completionPage = "completion_page";
const productDetailPage = "product_detail_page";

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case homePage:
      return MaterialPageRoute(builder: (context) => const HomePage());
    case transactionPage:
      FakestoreModel product = settings.arguments as FakestoreModel;
      return MaterialPageRoute(builder: (context) => TransactionPage(product: product));
    case productDetailPage:
      FakestoreModel product = settings.arguments as FakestoreModel;
      return MaterialPageRoute(builder: (context) => ProductDetailPage(product: product));
    case completionPage:
      CompletionPageArguments arguments = settings.arguments as CompletionPageArguments;
      return MaterialPageRoute(builder: (context) => CompletionPage(product: arguments.product, quantity: arguments.quantity));
    default:
      throw("Page not found");
  }
}