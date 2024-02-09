import 'package:flutter/material.dart';
import 'package:money_app_demo/themes/app_themes.dart';
import 'package:money_app_demo/utils/size_cal.dart';
import 'package:money_app_demo/utils/route.dart' as route;

class TransactionMenuCard extends StatelessWidget {
  const TransactionMenuCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppTheme.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 3.5,
      shadowColor: AppTheme.backgroundColor.withOpacity(1.0),
      margin: EdgeInsets.symmetric(
        horizontal: getPercentageWidth(context, 5.33),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: getPercentageHeight(context, 1.84),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () => Navigator.pushNamed(context, route.payPay),
              child: _cardItem(
                iconPath: 'assets/icons/phone_icon.png',
                text: 'Pay',
              ),
            ),
            _cardItem(
              iconPath: 'assets/icons/wallet_icon.png',
              text: 'Top up',
            ),
            _cardItem(
              iconPath: 'assets/icons/loan_icon.png',
              text: 'Loan',
            )
          ],
        ),
      ),
    );
  }

  Widget _cardItem({required String iconPath, required String text}) {
    return Column(
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(iconPath),
            ),
          ),
        ),
        Text(
          text,
          style: MoneyAppTextStyle.smallText,
        )
      ],
    );
  }
}
