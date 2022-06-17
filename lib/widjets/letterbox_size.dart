import 'package:flutter/material.dart';

class LetterBoxSize{
  double? tabletWidth;
  double? tabletHeight;
  double? backGroundWidth;
  double? backGroundHeight;
  double? widthRatio;
  double? heightRatio;
  double? widthAdd;
  double? heightAdd;

  LetterBoxSize(tabletWidth, tabletHeight, backGroundWidth, backGroundHeight){
    heightAdd = ((backGroundWidth * tabletHeight / tabletWidth) - backGroundHeight) / 2;
    widthAdd = ((backGroundHeight * tabletWidth / tabletHeight) - backGroundWidth) / 2;
    widthRatio = tabletWidth/backGroundWidth;
    heightRatio = tabletHeight/backGroundHeight;
    if(widthAdd! < 0){
      widthAdd = 0;
    }
    if(heightAdd! < 0){
      heightAdd = 0;
    }
  }

}