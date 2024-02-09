import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:money_app_demo/application/model/transactions_model/transactions_model.dart';
import 'package:money_app_demo/themes/app_themes.dart';
import 'package:money_app_demo/utils/size_cal.dart';
import 'package:money_app_demo/utils/route.dart' as route;

class TransactionsListWidget extends StatefulWidget {
  const TransactionsListWidget({Key? key}) : super(key: key);

  @override
  State<TransactionsListWidget> createState() => _TransactionsListWidgetState();
}

class _TransactionsListWidgetState extends State<TransactionsListWidget> {
  @override
  Widget build(BuildContext context) {
    TransactionsListModel _transactionsListModel =
        TransactionsListModel.fromJson(transactionJson);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: getPercentageHeight(context, 1.84),
            bottom: getPercentageHeight(context, 0.87),
            right: getPercentageWidth(context, 5.33),
            left: getPercentageWidth(context, 5.33),
          ),
          child: const Text(
            "Recent Activity",
            style: MoneyAppTextStyle.mediumText,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _transactionsListModel.transactionList.length,
            itemBuilder: (BuildContext context, int index) {
              return _transactionsItemView(
                  transactionListItemModel:
                      _transactionsListModel.transactionList[index]);
            },
          ),
        )
      ],
    );
  }

  Widget _transactionsItemView(
      {required TransactionList transactionListItemModel}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getPercentageWidth(context, 5.33),
            vertical: getPercentageHeight(context, 1),
          ),
          child: Text(
            transactionListItemModel.transactionDay ?? "-",
            style: MoneyAppTextStyle.smallText.copyWith(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: AppTheme.secondaryColor,
            ),
          ),
        ),
        Container(
          color: AppTheme.whiteColor,
          child: Column(
            children: transactionListItemModel.transactions!
                .map(
                  (paymentItem) =>
                      TransactionPaymentItem(paymentItem: paymentItem),
                )
                .toList(),
          ),
        )
      ],
    );
  }
}

class TransactionPaymentItem extends StatelessWidget {
  final Transactions paymentItem;

  const TransactionPaymentItem({Key? key, required this.paymentItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String iconPath = paymentItem.transactionType == "PAYMENT"
        ? 'assets/icons/payment_icon.png'
        : 'assets/icons/topup_icon.png';
    Color _amountTextColor = paymentItem.transactionType == "TOP-UP"
        ? AppTheme.primaryColor
        : AppTheme.textBlackColor;
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 15,
        horizontal: getPercentageWidth(context, 5.33),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, route.transactionDetailsPage, arguments: paymentItem),
        child: Row(
          children: [
            Image.asset(
              iconPath,
              height: 20,
              width: 20,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getPercentageWidth(context, 2.3),
                ),
                child: Text(
                  paymentItem.transactionTitle ?? "",
                  style: MoneyAppTextStyle.mediumText,
                ),
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  if (paymentItem.transactionType == "TOP-UP")
                    TextSpan(
                      text: "+",
                      style: MoneyAppTextStyle.title.copyWith(
                          height: 1.5, fontSize: 22.0, color: _amountTextColor),
                    ),
                  TextSpan(
                    text: "${paymentItem.transactionAmount!.round()}",
                    style: MoneyAppTextStyle.title.copyWith(
                      height: 1.5,
                      fontSize: 22.0,
                      fontWeight: FontWeight.w300,
                      color: _amountTextColor,
                    ),
                  ),
                  TextSpan(
                    text:
                        ".${paymentItem.transactionAmount?.toStringAsFixed(2).split('.').last}",
                    style: MoneyAppTextStyle.title.copyWith(
                      height: 1.5,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w300,
                      color: _amountTextColor,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Map<String, dynamic> transactionJson = {
  "transactionList": [
    {
      "transactionDay": "TODAY",
      "transactions": [
        {
          "transactionType": "PAYMENT",
          "transactionTitle": "eBay",
          "transactionAmount": 32.00
        },
        {
          "transactionType": "PAYMENT",
          "transactionTitle": "Merton Council",
          "transactionAmount": 65.00
        },
        {
          "transactionType": "TOP-UP",
          "transactionTitle": "Top Up",
          "transactionAmount": 150.00
        }
      ]
    },
    {
      "transactionDay": "YESTERDAY",
      "transactions": [
        {
          "transactionType": "PAYMENT",
          "transactionTitle": "Amazon",
          "transactionAmount": 32.00
        },
        {
          "transactionType": "PAYMENT",
          "transactionTitle": "John Snow",
          "transactionAmount": 1400.25
        },
        {
          "transactionType": "TOP-UP",
          "transactionTitle": "Top Up",
          "transactionAmount": 200.00
        }
      ]
    }
  ]
};
