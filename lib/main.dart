import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:gift_open/games/gift_grab_game.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(GameWidget(game: GiftGrabGame()));
}

