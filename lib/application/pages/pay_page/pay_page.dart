import 'package:flutter/material.dart';
import 'package:money_app_demo/application/provider/pay_provider/pay_amount_provider.dart';
import 'package:money_app_demo/components/custom_button.dart';
import 'package:money_app_demo/components/money_app_bar.dart';
import 'package:money_app_demo/components/number_pad.dart';
import 'package:money_app_demo/themes/app_themes.dart';
import 'package:money_app_demo/utils/size_cal.dart';
import 'package:provider/provider.dart';
import 'package:money_app_demo/utils/route.dart' as route;


class PayPage extends StatefulWidget {
  const PayPage({Key? key}) : super(key: key);

  @override
  _PayPageState createState() => _PayPageState();
}

class _PayPageState extends State<PayPage> {
  TextEditingController controller = TextEditingController();
  String amountStr = "";

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PayAmountProvider>(
      create: (_) => PayAmountProvider(),
      child: Consumer<PayAmountProvider>(
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: AppTheme.primaryColor,
            appBar: const MoneyAppBar(
              title: 'MoneyApp',
              automaticallyImplyLeading: false,
              isCloseButton: true,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      top: getPercentageHeight(context, 15.51) -
                          AppBar().preferredSize.height,
                      bottom: getPercentageHeight(context, 7),
                    ),
                    child: Text(
                      "How much?",
                      style: MoneyAppTextStyle.title.copyWith(height: 1.5),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: "£",
                      style: MoneyAppTextStyle.title
                          .copyWith(height: 1.5, fontSize: 25),
                      children: [
                        TextSpan(
                          text: model.amount.isNotEmpty
                              ? "${double.tryParse(model.amount)!.toInt()}"
                              : "0",
                          style: MoneyAppTextStyle.title
                              .copyWith(height: 1.5, fontSize: 50),
                        ),
                        TextSpan(
                          text: getDecimalPlaces(model.amount),
                          style: MoneyAppTextStyle.title.copyWith(height: 1.5),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: getPercentageHeight(context, 10),
                  ),
                  NumPad(
                    controller: controller,
                    buttonSize: getPercentageHeight(context, 7),
                    onChange: (v) {
                      if (amountStr.contains(".")) {
                        if (v != "." && amountStr.split(".").last.length < 2) {
                          amountStr += v;
                          if (amountStr.isNotEmpty) {
                            model.setAmount(amountStr);
                          }
                        }
                      } else {
                        amountStr +=
                            amountStr.isEmpty && v.toString().contains(".")
                                ? "0$v"
                                : v;
                        if (amountStr.isNotEmpty) {
                          model.setAmount(amountStr);
                        }
                      }
                    },
                    delete: () {
                      if(amountStr.isNotEmpty){
                        amountStr = amountStr.substring(0, amountStr.length - 1);
                        model.setAmount(amountStr);
                      }
                    },
                    onSubmit: () {},
                  ),
                  SizedBox(
                    height: getPercentageHeight(context, 10),
                  ),

                  CustomButton(
                    onPressed: () {
                      Navigator.pushNamed(context, route.payWhoPage);
                    },
                    child: const Text(
                      'Next',
                      style: MoneyAppTextStyle.buttonTextStyle,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }


  String getDecimalPlaces(String number) {
    int decimals = 0;
    if (number.isNotEmpty && number.contains(".")) {
      List<String> substr = number.toString().split('.');
      if (substr.isNotEmpty) decimals = int.tryParse(substr[1]) ?? 0;
      return decimals > 0 || number.contains(".") ? ".$decimals" : "";
    } else {
      return "";
    }
  }
}

