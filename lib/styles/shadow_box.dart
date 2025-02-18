import 'package:flutter/material.dart';

enum Direction{
  up,
  down,
  left,
  right,
}

class ShadowBox {
  static getStyle({Direction direction = Direction.down}) {
    const Offset up = Offset(0, -4);
    const Offset down = Offset(0, 4);
    const Offset left = Offset(-4, 0);
    const Offset right = Offset(4, 0);
    Offset offset = Offset.zero;
    switch (direction) {
      case Direction.up:
        offset = up;
        break;
      case Direction.down:
        offset = down;
        break;
      case Direction.left:
        offset = left;
        break;
      case Direction.right:
        offset = right;
        break;
    }
    return BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.35), // Colore dell'ombra
          blurRadius: 2, // Sfocatura
          offset: offset, // Ombra verso l'alto
        ),
      ],
    );
  }
}
