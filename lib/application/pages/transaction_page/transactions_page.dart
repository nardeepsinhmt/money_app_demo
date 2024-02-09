import 'package:flutter/material.dart';
import 'package:money_app_demo/components/money_app_bar.dart';
import 'package:money_app_demo/themes/app_themes.dart';
import 'package:money_app_demo/utils/size_cal.dart';

import 'transaction_menu_card.dart';
import 'transactions_list_widget.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MoneyAppBar(
        title: "MoneyApp",
      ),
      body: Stack(
        children: [
          const CurrentAmountHeaderCard(),
          Positioned(
            left: 0.0,
            right: 0.0,
            top: getPercentageHeight(context, 19.22),
            bottom: 0.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                TransactionMenuCard(),
                Expanded(
                  child: TransactionsListWidget(),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CurrentAmountHeaderCard extends StatelessWidget {
  final double amount = 150.25;

  const CurrentAmountHeaderCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(color: AppTheme.primaryColor),
          width: getPercentageWidth(context, 100),
          height: getPercentageHeight(context, 25.36945812807882),
          child: Padding(
            padding: EdgeInsets.only(bottom: AppBar().preferredSize.height),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    text: "£",
                    style: MoneyAppTextStyle.title
                        .copyWith(height: 1.5, fontSize: 25),
                    children: [
                      TextSpan(
                        text: "${amount.round()}",
                        style: MoneyAppTextStyle.title
                            .copyWith(height: 1.5, fontSize: 50),
                      ),
                      TextSpan(
                        text: ".${int.tryParse(
                          amount.toString().split('.')[1].substring(0, 2),
                        )}",
                        style: MoneyAppTextStyle.title.copyWith(height: 1.5),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
