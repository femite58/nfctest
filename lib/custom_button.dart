import 'package:flutter/material.dart';

import 'theme.dart';

class CustomButton extends StatelessWidget {
  final String text;
  // final Function? onClick;
  final VoidCallback onClick;
  final String type;
  final bool isLoading;
  final bool disabled;
  const CustomButton({
    super.key,
    required this.text,
    required this.onClick,
    this.isLoading = false,
    this.disabled = false,
    this.type = 'primBtn',
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: disabled || isLoading ? null : onClick,
      child: Opacity(
        opacity: disabled ? .4 : 1,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 55,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: type == 'primBtn' ? AppTheme.appColor : Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppTheme.appColor),
          ),
          child: isLoading
              ? SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      type == 'primBtn' ? Colors.white : AppTheme.appColor,
                    ),
                    strokeWidth: 3,
                  ),
                )
              : Text(
                  text,
                  style: TextStyle(
                    fontSize: 15,
                    color: type == 'primBtn' ? Colors.white : AppTheme.appColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
        ),
      ),
    );
  }
}
