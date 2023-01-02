import 'package:excellent_loading/excellent_loading.dart';
import 'package:excellent_loading/overlay_entry.dart';
import 'package:flutter/material.dart';

class FlutterExcellentLoading extends StatefulWidget {
  final Widget? child;
  const FlutterExcellentLoading({super.key, required this.child})
      : assert(child != null);

  @override
  State<FlutterExcellentLoading> createState() =>
      _FlutterExcellentLoadingState();
}

class _FlutterExcellentLoadingState extends State<FlutterExcellentLoading> {
  late ExcellentLoadingOverlayEntry _overlayEntry;
  @override
  void initState() {
    _overlayEntry = ExcellentLoadingOverlayEntry(
      builderx: (BuildContext context) =>
          ExcellentLoading.instance.w ?? Container(),
    );
    ExcellentLoading.instance.overlayEntry = _overlayEntry;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Overlay(
        initialEntries: [
          ExcellentLoadingOverlayEntry(
            builderx: (BuildContext context) {
              if (widget.child != null) {
                return widget.child!;
              } else {
                return Container();
              }
            },
          ),
          _overlayEntry,
        ],
      ),
    );
  }
}
