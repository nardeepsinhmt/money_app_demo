import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_app_demo/application/model/transactions_model/transactions_model.dart';
import 'package:money_app_demo/application/provider/transactions_provider/switch_toggle_provider.dart';
import 'package:money_app_demo/components/custom_switch_widget.dart';
import 'package:money_app_demo/components/money_app_bar.dart';
import 'package:money_app_demo/themes/app_themes.dart';
import 'package:money_app_demo/utils/size_cal.dart';
import 'package:provider/provider.dart';

class TransactionDetailsPage extends StatefulWidget {
  final Transactions paymentItem;

  const TransactionDetailsPage({
    Key? key,
    required this.paymentItem,
  }) : super(key: key);

  @override
  _TransactionDetailsPageState createState() => _TransactionDetailsPageState();
}

class _TransactionDetailsPageState extends State<TransactionDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MoneyAppBar(
        title: 'MoneyApp',
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: getPercentageHeight(context, 2.09),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getPercentageWidth(context, 5.33)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 64,
                        width: 64,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/icons/payment_icon.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Text(
                        widget.paymentItem.transactionTitle??"",
                        style:
                        MoneyAppTextStyle.mediumText.copyWith(fontSize: 22),
                      ),
                      Text(
                        "01 JANUARY 2022 01:23 PM",
                        style: MoneyAppTextStyle.smallText.copyWith(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.secondaryColor),
                      )
                    ],
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        // if (paymentItem.transactionType == "TOP-UP")
                        //   TextSpan(
                        //     text: "+",
                        //     style: MoneyAppTextStyle.title.copyWith(
                        //         height: 1.5, fontSize: 22.0, color: _amountTextColor),
                        //   ),
                        TextSpan(
                          text: "${widget.paymentItem.transactionAmount!.round()}",
                          style: MoneyAppTextStyle.mediumText
                              .copyWith(height: 1.5, fontSize: 37.0, fontWeight: FontWeight.w300),
                        ),
                        TextSpan(
                          text: ".${widget.paymentItem.transactionAmount!.toStringAsFixed(2).split('.').last}",
                          style: MoneyAppTextStyle.mediumText
                              .copyWith(height: 1.5, fontSize: 26.0, fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const TransactionFeatureItem(
              featureText: "Add receipt",
              iconPath: "assets/icons/payment_receipt_icon.png",
            ),
            const TransactionFeatureItem(
              featureText: "Split this bill",
              iconPath: "assets/icons/share_cost_icon.png",
              titleText: "SHARE THE COST",
            ),
            TransactionFeatureItem(
              padding: EdgeInsets.only(
                top: getPercentageHeight(context, 3.81),
                left: getPercentageWidth(context, 5.33),
                bottom: 5,
              ),
              featureText: "Repeating payment",
              titleText: "SUBSCRIPTION",
              isSwitch: true,
            ),
            const TransactionFeatureItem(
              featureText: "Something wrong? Get help",
            ),

            Container(
              margin: EdgeInsets.only(top: getPercentageHeight(context, 5.91), bottom: 10),
              alignment: Alignment.center,
              child: Text(
                "Transaction ID #1223SD23RWDF2DFAS eBay - Merchant ID #1245",
                textAlign: TextAlign.center,
                style: MoneyAppTextStyle.smallText.copyWith(
                  fontSize: 10.0,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.secondaryColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TransactionFeatureItem extends StatelessWidget {
  final String? titleText;
  final String featureText;
  final String? iconPath;
  final bool isSwitch;
  final bool isError;
  final EdgeInsetsGeometry? padding;

  const TransactionFeatureItem({
    Key? key,
    required this.featureText,
    this.titleText,
    this.isSwitch = false,
    this.isError = false,
    this.iconPath,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: padding ?? EdgeInsets.only(
            top: getPercentageHeight(context, 5.78),
            left: getPercentageWidth(context, 5.33),
            bottom: 5,
          ),
          child: Text(
            titleText ?? "",
            style: MoneyAppTextStyle.mediumText,
          ),
        ),
        Container(
          color: AppTheme.whiteColor,
          padding: EdgeInsets.symmetric(
            horizontal: getPercentageWidth(context, 5.33),
            vertical: getPercentageHeight(context, 1.84),
          ),
          child: Row(
            children: [
              iconPath == null
                  ? const SizedBox()
                  : Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(iconPath ?? ""),
                  ),
                ),
              ),
              SizedBox(
                width: getPercentageWidth(context, 3.2),
              ),
              Text(
                featureText,
                style: MoneyAppTextStyle.mediumText.copyWith(
                  fontWeight: FontWeight.w500,
                  color:
                  isError ? AppTheme.errorColor : AppTheme.textBlackColor,
                ),
              ),
              const Spacer(),
              isSwitch ? ChangeNotifierProvider<SwitchToggleProvider>(
                      create: (_) => SwitchToggleProvider(),
                      child: Consumer<SwitchToggleProvider>(
                        builder: (BuildContext context, switchValue, Widget? child) {
                          return CustomSwitch(
                            value: switchValue.isSwitch,
                            onChanged: (bool val) {
                              switchValue.setSwitchValue(val);
                            },
                          );
                        },
                      ),
                    )
                  : const SizedBox(height: 25,),
            ],
          ),
        ),
      ],
    );
  }
}





