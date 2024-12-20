import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:gift_open/constants/globals.dart';
import 'package:gift_open/games/gift_grab_game.dart';
import 'dart:math' as math;

class IceComponent extends SpriteComponent with HasGameRef<GiftGrabGame> , CollisionCallbacks {
  final double _spriteHeight = 160;

  final Vector2 startPosition;

  late Vector2 _velocity;
  double speed = 300;

  double degree = math.pi / 180;

  IceComponent({required this.startPosition});

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    sprite = await gameRef.loadSprite(Globals.iceSprite);
    position = startPosition;
    width = height = _spriteHeight;
    anchor = Anchor.center;

    double spawnAngle = _getSpawnAngle();

    final double vx = math.cos(spawnAngle * degree) * speed;
    final double vy = math.sin(spawnAngle * degree) * speed;

    _velocity = Vector2(vx, vy);

    add(CircleHitbox());

  }

  @override
  void update(dt) {
    super.update(dt);

    position += _velocity * dt;
  }


  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if(other is ScreenHitbox) {
      final Vector2 collisionPoint  = intersectionPoints.first;
print("collisionPoint.y ===> ${collisionPoint.y}");
print("collisionPoint.x ===> ${collisionPoint.x}");

      if(collisionPoint.x == 0){
        _velocity.x = -_velocity.x;
        _velocity.y = _velocity.y;
      }

      if(collisionPoint.x == gameRef.size.x){
        _velocity.x = -_velocity.x;
        _velocity.y = _velocity.y;
      }

      if(collisionPoint.y == 0){
        _velocity.x = _velocity.x;
        _velocity.y = -_velocity.y;
      }

      if(collisionPoint.y == gameRef.size.y){
        _velocity.x = _velocity.x;
        _velocity.y = -_velocity.y;
      }

    }
  }

  double _getSpawnAngle() {
    final random = math.Random().nextDouble();

    final spawnAngle = lerpDouble(0, 360, random)!;

    return spawnAngle;
  }
}