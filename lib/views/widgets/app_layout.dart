import 'package:flutter/material.dart';

class AppLayout extends StatelessWidget {
  final Widget header;
  final Widget body;
  final Color backgroundColor;
  final bool hasSafeAreaBody;

  const AppLayout({
    required this.header,
    required this.body,
    this.backgroundColor = Colors.blue,
    this.hasSafeAreaBody = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: backgroundColor,
        child: Column(
          children: [
            SafeArea(
              bottom: false,
              child: Container(
                height: 10,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.red,
                      width: 1.5,
                    ),
                  ),
                ),
                child: header,
              ),
            ),
            Expanded(
              child: hasSafeAreaBody
                  ? SafeArea(
                      top: false,
                      child: body,
                    )
                  : body,
            ),
          ],
        ),
      ),
    );
  }
}
