import 'package:flutter/material.dart';
import 'package:money_app_demo/components/custom_button.dart';
import 'package:money_app_demo/components/money_app_bar.dart';
import 'package:money_app_demo/themes/app_themes.dart';
import 'package:money_app_demo/utils/size_cal.dart';

class PayWhoPage extends StatefulWidget {
  const PayWhoPage({Key? key}) : super(key: key);

  @override
  _PayWhoPageState createState() => _PayWhoPageState();
}

class _PayWhoPageState extends State<PayWhoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryColor,
      appBar: const MoneyAppBar(
        title: 'MoneyApp',
        automaticallyImplyLeading: false,
        isCloseButton: true,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: getPercentageHeight(context, 15.51) -
                  AppBar().preferredSize.height,
              bottom: getPercentageHeight(context, 8),
            ),
            child: Text(
              "To whom?",
              style: MoneyAppTextStyle.title.copyWith(height: 1.5),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getPercentageWidth(context, 5.33),
            ),
            child: TextFormField(
              style: const TextStyle(
                color: Colors.white,
                fontFamily: AppTheme.fontName,
              ),
              cursorColor: AppTheme.whiteColor,
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppTheme.whiteColor),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppTheme.whiteColor),
                ),
              ),
            ),
          ),
          const Spacer(),
          CustomButton(
            onPressed: () {},
            child: const Text(
              'Pay',
              style: MoneyAppTextStyle.buttonTextStyle,
            ),
          ),
          SizedBox(
            height: getPercentageHeight(context, 4),
          )
        ],
      ),
    );
  }
}

