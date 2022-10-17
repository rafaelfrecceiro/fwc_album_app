import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

mixin Loader<T extends StatefulWidget> on State<T> {
  var isOpen = false;

  void showLoader() {
    log('abri o loader - $isOpen');
    if (!isOpen) {
      showDialog(
        context: context,
        builder: (_) {
          return LoadingAnimationWidget.threeArchedCircle(
            color: Colors.white,
            size: 60,
          );
        },
      );
    }
  }

  void hideLoader() {
    log('mandei fechar o loader - $isOpen');
    //if (isOpen) {
    isOpen = false;
    Navigator.of(context).pop();
    //}
  }
}
