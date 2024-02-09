import 'package:flutter/material.dart';
import 'package:money_app_demo/application/model/transactions_model/transactions_model.dart';
import 'package:money_app_demo/application/pages/pay_page/pay_page.dart';
import 'package:money_app_demo/application/pages/pay_page/pay_who_page.dart';
import 'package:money_app_demo/application/pages/top_up_page.dart';
import 'package:money_app_demo/application/pages/transaction_page/transaction_details_page.dart';
import 'package:money_app_demo/application/pages/transaction_page/transactions_page.dart';

// Route Names
const String initialPage = 'initialPage';
const String transactionsPage = 'transactionsPage';
const String transactionDetailsPage = 'transactionDetailsPage';
const String topUpPage = 'topUpPage';
const String payPay = 'payPay';
const String payWhoPage = 'payWhoPage';

// Control our page route flow
Route<dynamic> routeController(RouteSettings settings) {
  switch (settings.name) {
    case initialPage:
      return MaterialPageRoute(builder: (context) => const TransactionPage());
    case transactionsPage:
      return MaterialPageRoute(builder: (context) => const TransactionPage());
    case transactionDetailsPage:
      return MaterialPageRoute(builder: (context) => TransactionDetailsPage(paymentItem: settings.arguments as Transactions,));
    case topUpPage:
      return MaterialPageRoute(builder: (context) => const TopUpPage());
    case payPay:
      return MaterialPageRoute(builder: (context) => const PayPage(), fullscreenDialog: true);
    case payWhoPage:
      return MaterialPageRoute(builder: (context) => const PayWhoPage(), fullscreenDialog: true);
    default:
      throw ('This route name does not exit');
  }
}
