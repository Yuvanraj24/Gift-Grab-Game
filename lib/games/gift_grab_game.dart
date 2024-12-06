import 'package:flame/collisions.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:gift_open/components/background_component.dart';
import 'package:gift_open/components/gift_component.dart';
import 'package:gift_open/components/ice_component.dart';
import 'package:gift_open/components/santa_component.dart';
import 'package:gift_open/constants/globals.dart';
import 'package:gift_open/inputs/joystick.dart';
import 'package:flame_audio/flame_audio.dart';

class GiftGrabGame extends FlameGame with DragCallbacks, HasCollisionDetection {
  int score = 0;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    add(BackgroundComponent());

    add(SantaComponent(joystick: joystick));

    add(GiftComponent());

    add(joystick);

    FlameAudio.audioCache.loadAll([
      Globals.itemGrabSound,
    ]);
    
    
    add(IceComponent(startPosition: Vector2(200, 200)));
    add(IceComponent(startPosition: Vector2(size.x - 200, size.y - 200)));
    
    add(ScreenHitbox());
  }
}
