import 'package:flutter/material.dart';

import 'theme.dart';

class PageLoader extends StatelessWidget {
  const PageLoader(this.text, {super.key, this.height, this.items});
  final double? height;
  final String text;
  final List<Widget>? items;

  @override
  Widget build(BuildContext context) {
    var sz = MediaQuery.of(context).size;
    return Container(
      width: sz.width,
      height: height ?? sz.height - 100,
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 40,
              width: 40,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(AppTheme.appColor),
                  strokeWidth: 4,
                ),
              ),
            ),
            Text(text),
            if (items != null) ...(items as List),
          ],
        ),
      ),
    );
  }
}
