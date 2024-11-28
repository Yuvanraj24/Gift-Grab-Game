import 'package:flame/components.dart';
import 'package:gift_open/constants/globals.dart';
import 'package:gift_open/games/gift_grab_game.dart';

class BackgroundComponent extends SpriteComponent with HasGameRef<GiftGrabGame> {
  @override
  Future<void> onLoad() async {
    await super.onLoad();

    sprite = await gameRef.loadSprite(Globals.backgroundSprite);
    size = gameRef.size;
  }
}