import 'package:flutter/material.dart';

enum AppButtonType {
  solid,
  outlined,
}

class AppButton extends StatelessWidget {
  final void Function()? onPressed;
  final String semanticLabel;
  final double height;
  final Color? btnColor;
  final Color? textColor;
  final Widget child;
  final AppButtonType type;
  final BorderRadius? borderRadius;

  const AppButton({
    Key? key,
    required this.semanticLabel,
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
    final primaryColor = btnColor ?? Theme.of(context).primaryColor;
    final onPrimaryColor = textColor ?? Colors.white;

    return type == AppButtonType.solid
        ? FlatButton(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            onPressed: onPressed,
            color: primaryColor,
            textColor: onPrimaryColor,
            disabledColor: Theme.of(context).disabledColor,
            disabledTextColor: onPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(5),
            ),
            child: child,
          )
        : OutlineButton(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            onPressed: onPressed,
            color: primaryColor,
            borderSide: BorderSide(
              width: 2,
              color: primaryColor,
            ),
            textColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(5),
            ),
            child: child,
          );
  }
}
