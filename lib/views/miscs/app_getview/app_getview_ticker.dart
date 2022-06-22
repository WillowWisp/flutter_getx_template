import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

abstract class AppGetViewTicker<T> extends StatefulWidget {
  final T Function(BuildContext context, TickerProvider vsync)
      controllerRegister;

  const AppGetViewTicker({
    Key? key,
    required this.controllerRegister,
  }) : super(key: key);

  @override
  _AppGetViewTickerState<T> createState() => _AppGetViewTickerState<T>();

  Widget build(BuildContext context, T controller);
}

class _AppGetViewTickerState<T> extends State<AppGetViewTicker<T>>
    with SingleTickerProviderStateMixin {
  final String _tag = const Uuid().v4();

  T get controller => Get.find<T>(tag: _tag);

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    Get.put<T>(
      widget.controllerRegister(context, this),
      tag: _tag,
      permanent: true,
    );
  }

  @override
  void dispose() {
    Get.delete<T>(tag: _tag, force: true);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.build(context, controller);
  }
}
