import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

abstract class AppGetView<T> extends StatefulWidget {
  final T initialController;

  const AppGetView({
    Key? key,
    required this.initialController,
  }) : super(key: key);

  @override
  _AppGetViewState<T> createState() => _AppGetViewState<T>();

  Widget build(BuildContext context, T controller);
}

class _AppGetViewState<T> extends State<AppGetView<T>> {
  final String _tag = const Uuid().v4();

  T get controller => Get.find<T>(tag: _tag);

  @override
  void initState() {
    super.initState();

    Get.put<T>(widget.initialController, tag: _tag);
  }

  @override
  Widget build(BuildContext context) {
    return widget.build(context, controller);
  }
}
