import 'package:flutter/material.dart';
import 'package:money_app_demo/themes/app_themes.dart';
import 'package:money_app_demo/utils/size_cal.dart';

class MoneyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor = AppTheme.primaryColor;
  final String title;
  final List<Widget>? widgets;
  final bool automaticallyImplyLeading;
  final bool isCloseButton;

  const MoneyAppBar({
    Key? key,
    required this.title,
    this.widgets,
    this.automaticallyImplyLeading: true,
    this.isCloseButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: MoneyAppTextStyle.appBarTitle,
      ),
      elevation: 0,
      automaticallyImplyLeading: automaticallyImplyLeading,
      backgroundColor: backgroundColor,
      actions: [
        if (isCloseButton)
          Padding(
            padding: EdgeInsets.only(right: getPercentageWidth(context, 3.733)),
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: 20,
                height: 20,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/icons/close_icon.png"),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
