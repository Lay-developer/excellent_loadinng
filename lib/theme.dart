// The MIT License (MIT)
//
// Copyright (c) 2020 nslogx
//
// Permission is hereby granted, free of charge, to any person obtaining a
// copy of this software and associated documentation files (the "Software"),
// to deal in the Software without restriction, including without limitation
// the rights to use, copy, modify, merge, publish, distribute, sublicense,
// and/or sell copies of the Software, and to permit persons to whom the
// Software is furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included
// in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
// OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
// THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
// IN THE SOFTWARE.

import 'package:excellent_loading/animation.dart';
import 'package:excellent_loading/excellent_loading.dart';
import 'package:excellent_loading/offset_animation.dart';
import 'package:excellent_loading/opacity_animation.dart';
import 'package:excellent_loading/scale_animation.dart';
import 'package:flutter/material.dart';

class ExcellentLoadingTheme {
  /// color of indicator
  static Color get indicatorColor =>
      ExcellentLoading.instance.loadingStyle == ExcellentLoadingStyle.custom
          ? ExcellentLoading.instance.indicatorColor!
          : ExcellentLoading.instance.loadingStyle == ExcellentLoadingStyle.dark
              ? Colors.white
              : Colors.black;

  /// progress color of loading
  static Color get progressColor =>
      ExcellentLoading.instance.loadingStyle == ExcellentLoadingStyle.custom
          ? ExcellentLoading.instance.progressColor!
          : ExcellentLoading.instance.loadingStyle == ExcellentLoadingStyle.dark
              ? Colors.white
              : Colors.black;

  /// background color of loading
  static Color get backgroundColor =>
      ExcellentLoading.instance.loadingStyle == ExcellentLoadingStyle.custom
          ? ExcellentLoading.instance.backgroundColor!
          : ExcellentLoading.instance.loadingStyle == ExcellentLoadingStyle.dark
              ? Colors.black.withOpacity(0.9)
              : Colors.white;

  /// boxShadow color of loading
  static List<BoxShadow>? get boxShadow =>
      ExcellentLoading.instance.loadingStyle == ExcellentLoadingStyle.custom
          ? ExcellentLoading.instance.boxShadow ?? [const BoxShadow()]
          : null;

  /// font color of status
  static Color get textColor =>
      ExcellentLoading.instance.loadingStyle == ExcellentLoadingStyle.custom
          ? ExcellentLoading.instance.textColor!
          : ExcellentLoading.instance.loadingStyle == ExcellentLoadingStyle.dark
              ? Colors.white
              : Colors.black;

  /// mask color of loading
  static Color maskColor(ExcellentLoadingMaskType? maskType) {
    maskType ??= ExcellentLoading.instance.maskType;
    return maskType == ExcellentLoadingMaskType.custom
        ? ExcellentLoading.instance.maskColor!
        : maskType == ExcellentLoadingMaskType.black
            ? Colors.black.withOpacity(0.5)
            : Colors.transparent;
  }

  /// loading animation
  static ExcellentLoadingAnimation get loadingAnimation {
    ExcellentLoadingAnimation animation;
    switch (ExcellentLoading.instance.animationStyle) {
      case ExcellentLoadingAnimationStyle.offset:
        animation = OffsetAnimation();
        break;
      case ExcellentLoadingAnimationStyle.scale:
        animation = ScaleAnimation();
        break;
      default:
        animation = OpacityAnimation();
        break;
    }
    return animation;
  }

  /// font size of status
  static double get fontSize => ExcellentLoading.instance.fontSize;

  /// size of indicator
  static double get indicatorSize => ExcellentLoading.instance.indicatorSize;

  /// width of progress indicator
  static double get progressWidth => ExcellentLoading.instance.progressWidth;

  /// width of indicator
  static double get lineWidth => ExcellentLoading.instance.lineWidth;

  /// loading indicator type
  static ExcellentLoadingIndicatorType get indicatorType =>
      ExcellentLoading.instance.indicatorType;

  /// toast position
  static ExcellentLoadingToastPosition get toastPosition =>
      ExcellentLoading.instance.toastPosition;

  /// toast position
  static AlignmentGeometry alignment(ExcellentLoadingToastPosition? position) =>
      position == ExcellentLoadingToastPosition.bottom
          ? AlignmentDirectional.bottomCenter
          : (position == ExcellentLoadingToastPosition.top
              ? AlignmentDirectional.topCenter
              : AlignmentDirectional.center);

  /// display duration
  static Duration get displayDuration =>
      ExcellentLoading.instance.displayDuration;

  /// animation duration
  static Duration get animationDuration =>
      ExcellentLoading.instance.animationDuration;

  /// contentPadding of loading
  static EdgeInsets get contentPadding =>
      ExcellentLoading.instance.contentPadding;

  /// padding of status
  static EdgeInsets get textPadding => ExcellentLoading.instance.textPadding;

  /// textAlign of status
  static TextAlign get textAlign => ExcellentLoading.instance.textAlign;

  /// textStyle of status
  static TextStyle? get textStyle => ExcellentLoading.instance.textStyle;

  /// radius of loading
  static double get radius => ExcellentLoading.instance.radius;

  /// should dismiss on user tap
  static bool? get dismissOnTap => ExcellentLoading.instance.dismissOnTap;

  static bool ignoring(ExcellentLoadingMaskType? maskType) {
    maskType ??= ExcellentLoading.instance.maskType;
    return ExcellentLoading.instance.userInteractions ??
        (maskType == ExcellentLoadingMaskType.none ? true : false);
  }
}
