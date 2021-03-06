import 'package:flutter/material.dart';

class TextUtils extends Text{
  TextUtils( String text, { couleur: Colors.black,
                            textScaleFactor:1.5 } ) :
        super(
        text,
        textScaleFactor:textScaleFactor ,
        style: new TextStyle(
          color: couleur,
        ),
      );

}