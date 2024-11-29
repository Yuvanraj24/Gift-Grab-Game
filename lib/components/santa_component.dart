import 'package:flame/components.dart';
import 'package:gift_open/constants/globals.dart';
import 'package:gift_open/games/gift_grab_game.dart';

class SantaComponent extends SpriteComponent with HasGameRef<GiftGrabGame> {
  final double _spriteHeight = 200;
  @override
  Future<void> onLoad() async {
    await super.onLoad();

    sprite = await gameRef.loadSprite(Globals.santaIdleSprite);
    position = gameRef.size / 2;
    height  = _spriteHeight;
    width = _spriteHeight * 1.45;
    anchor = Anchor.center;

  }
}