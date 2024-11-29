import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:gift_open/components/background_component.dart';
import 'package:gift_open/components/santa_component.dart';
import 'package:gift_open/inputs/joystick.dart';

class GiftGrabGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    await super.onLoad();

    add(BackgroundComponent());

    add(SantaComponent());

    add(joystick);
  }
}