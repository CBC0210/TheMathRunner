// 玩家類別的基本結構
class Player {
  PApplet app;
  float x;
  float y;

  Player(PApplet app) {
    this.app = app;
    this.x = 0;
    this.y = app.height / 4; // 固定在銀幕下方 1/4 位置
  }

  // 更新玩家位置
  void update(float relativeMouseX) {
    // 計算相對於滑鼠的 X 坐標，但限制在畫面左 1/3 和右 1/3 之間
    float minX = -app.width / 6;
    float maxX = app.width / 6;
    this.x = PApplet.constrain(relativeMouseX, minX, maxX);
  }

  // 繪製玩家
  void display() {
    app.fill(255, 0, 0); // 玩家顏色
    app.ellipse(x, y, 50, 50); // 在玩家位置繪製橢圓形
  }
}
