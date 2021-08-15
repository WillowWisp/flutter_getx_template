import 'package:flutter/material.dart';
import 'package:flutter_getx_template/common/widgets/app_button.dart';
import 'package:get/get.dart';

const double horizontalPadding = 16;

class AppDialogYesNo extends StatelessWidget {
  final String titleText;
  final String messageText;
  final void Function() onYes;
  final void Function()? onNo;

  const AppDialogYesNo({
    Key? key,
    required this.titleText,
    required this.messageText,
    required this.onYes,
    this.onNo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      titleText: titleText,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 24),
          Text(
            messageText,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 24),
        ],
      ),
      actions: [
        AppDialogAction(
          text: 'Cancel', // TODO translate
          onPressed: () {
            if (onNo != null) {
              onNo!();
            } else {
              Get.back();
            }
          },
          btnColor: Colors.grey[600],
          txtColor: Colors.white,
        ),
        AppDialogAction(
          text: 'OK', // TODO translate
          onPressed: () {
            onYes();
          },
          btnColor: Color(0xFFA21942),
          txtColor: Colors.white,
        ),
      ],
    );
  }
}

class AppDialog extends StatefulWidget {
  /// Default value is `primaryColor`
  final Color? headerColor;
  final String? titleText;
  final Widget body;
  final List<AppDialogAction>? actions;

  const AppDialog({
    Key? key,
    this.headerColor,
    this.titleText,
    required this.body,
    this.actions,
  }) : super(key: key);

  @override
  _AppDialogState createState() => _AppDialogState();
}

class _AppDialogState extends State<AppDialog> {
  void _closeDialog() {
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(3),
        child: Container(
          decoration: BoxDecoration(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTitle(),
              _buildContent(),
              _buildActionButtonsGroup(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return ExcludeSemantics(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: 15,
        ),
        decoration: BoxDecoration(
          color: Color(0xFFA21942),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                widget.titleText ?? '',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                _closeDialog();
              },
              child: Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
      ),
      child: widget.body,
    );
  }

  Widget _buildActionButtonsGroup() {
    final List<AppDialogAction>? actions = widget.actions;
    if (actions == null || actions.isEmpty) {
      return SizedBox();
    }

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: 15,
      ),
      child: Row(
        children: [
          ..._buildActionButtons(actions),
        ],
      ),
    );
  }

  List<Widget> _buildActionButtons(List<AppDialogAction> actions) {
    final List<Widget> outputList = [];
    for (int i = 0; i < actions.length; i++) {
      final AppDialogAction action = actions[i];

      // Action Button
      outputList.add(
        Expanded(
          child: AppButton(
            onPressed: action.onPressed,
            borderRadius: BorderRadius.circular(4),
            btnColor: action.btnColor,
            textColor: action.txtColor,
            child: Text(
              action.text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );

      // Gap between buttons
      if (i != actions.length - 1) {
        outputList.add(
          SizedBox(width: 10),
        );
      }
    }

    return outputList;
  }
}

class AppDialogAction {
  final String text;
  final Color? btnColor;
  final Color? txtColor;
  final void Function() onPressed;

  const AppDialogAction({
    required this.text,
    required this.onPressed,
    this.btnColor,
    this.txtColor,
  });
}
