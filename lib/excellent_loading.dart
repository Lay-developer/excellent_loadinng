library excellent_loading;

import 'package:flutter/material.dart';

enum LoadingType {
  inLeft,
  inRight,
  inTop,
}

class ExcellentLoading {
  //context

  //loading title
  late String title;

  //loading type
  late LoadingType loadingType = LoadingType.inTop;

  //loading color
  late Color color;

  //background color
  late Color backgroundColor;

  //border raduis
  late double borderRaduis;

  //loading stroke
  late double strokeRaduis;

  //loading value
  late double value;

  //tween color
  late List<Color> colors;

  late Duration? duration;

  OverlayState? overlayState;
  OverlayEntry? entry;

  factory ExcellentLoading() => _instance;
  static final ExcellentLoading _instance = ExcellentLoading.internal();

  ExcellentLoading.internal() {
    loadingType = LoadingType.inTop;
    backgroundColor = Colors.grey.shade200;
    borderRaduis = 15;
    color = Colors.blue;
    strokeRaduis = 0.75;
    duration = null;
  }

  static ExcellentLoading get instance => _instance;

  static void show(BuildContext context,
      {String? status, VoidCallback? onDissmiss}) {
    OverlayState? state = Overlay.of(context);
    OverlayEntry overlay = OverlayEntry(builder: (BuildContext context) {
      return Material(
        color: Colors.black.withOpacity(0.25),
        elevation: 0,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(15)),
          child: Container(
              width: 85,
              height: 85,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: _instance.backgroundColor,
                borderRadius: BorderRadius.circular(_instance.borderRaduis),
              ),
              child: _instance.loadingType == LoadingType.inLeft ||
                      _instance.loadingType == LoadingType.inRight
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _instance.loadingType == LoadingType.inLeft
                            ? const SizedBox()
                            : Text(status ?? ''),
                        CircularProgressIndicator.adaptive(
                          strokeWidth: _instance.strokeRaduis,
                          value: _instance.value,
                        ),
                        _instance.loadingType == LoadingType.inRight
                            ? const SizedBox()
                            : Text(status ?? '')
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          strokeWidth: _instance.strokeRaduis,
                          // value: _value,
                        ),
                        SizedBox(
                          height: status == null ? 0 : 15,
                        ),
                        status == null
                            ? const SizedBox()
                            : Text(
                                status,
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              )
                      ],
                    )),
        ),
      );
    });
    _instance.entry = overlay;
    state?.insert(_instance.entry ?? _instance._emptyEntry());
    if (_instance.duration != null) {
      Future.delayed(_instance.duration ?? const Duration(seconds: 3), () {
        dismiss();
      }).then((value) {
        if (onDissmiss != null) {
          onDissmiss();
        }
      });
    } else {
      onDissmiss!();
    }
  }

  static void dismiss() {
    _instance.entry?.remove();
  }

  OverlayEntry _emptyEntry() {
    return OverlayEntry(builder: (context) {
      return const SizedBox();
    });
  }
}
