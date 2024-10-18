// 抽象類別 GameObject
abstract class GameObject {
  PApplet app;
  Player player;
  float x;
  float y;

  GameObject(PApplet app, Player player, float x, float y) {
    this.app = app;
    this.player = player;
    this.x = x;
    this.y = y;
  }

  // 抽象方法，用於在子類別中定義顯示邏輯
  abstract void display();

  // 獲取相對於玩家的顯示位置
  float getRelativeX() {
    return x - player.x;
  }

  float getRelativeY() {
    return y - player.y;
  }
}
