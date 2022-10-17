import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/styles/colors_app.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';

class StickerPercent extends StatelessWidget {
  final int percent;

  const StickerPercent({
    super.key,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 70,
          height: 70,
          decoration:
              BoxDecoration(color: context.colors.grey, shape: BoxShape.circle),
          child: Center(
            child: Text(
              '$percent%',
              style: context.textStyles.titlePrimaryColor,
            ),
          ),
        ),
        SizedBox(
          width: 110,
          height: 110,
          child: Transform.rotate(
            angle: -pi / 2,
            child: CircularProgressIndicator(
              value: percent / 100,
              backgroundColor: Colors.white.withOpacity(0.5),
              color: Colors.white,
              strokeWidth: 5,
            ),
          ),
        )
      ],
    );
  }
}
