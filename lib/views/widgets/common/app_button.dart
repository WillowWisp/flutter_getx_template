import 'package:flutter/material.dart';
import 'package:flutter_getx_template/common/theme/app_colors.dart';

enum AppButtonType {
  solid,
  outlined,
}

class AppButton extends StatelessWidget {
  final void Function()? onPressed;
  final double height;
  final Color? btnColor;
  final Color? textColor;
  final Widget child;
  final AppButtonType type;
  final BorderRadius? borderRadius;

  const AppButton({
    Key? key,
    this.onPressed,
    this.height = 40,
    this.btnColor,
    this.textColor,
    required this.child,
    this.type = AppButtonType.solid,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: height,
      child: _buildButton(context),
    );
  }

  Widget _buildButton(BuildContext context) {
    return type == AppButtonType.solid
        ? TextButton(
            style: TextButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              backgroundColor: btnColor ?? AppColors.of(context).primary,
              primary: textColor ?? AppColors.of(context).onPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(5),
              ),
            ),
            onPressed: onPressed,
            child: child,
          )
        : OutlinedButton(
            onPressed: onPressed,
            style: OutlinedButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              primary: textColor ?? AppColors.of(context).primary,
              side: BorderSide(
                width: 1,
                color: btnColor ?? AppColors.of(context).primary,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(5),
              ),
            ),
            child: child,
          );
  }
}
