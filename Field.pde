
// 遊戲場地的基本結構
class Field extends GameObject {
  float width;
  float height;

  Field(PApplet app, Player player, float x, float y, float width, float height) {
    super(app, player, x, y);
    this.width = width;
    this.height = height;
  }

  // 繪製場地
  void display() {
    app.rectMode(CENTER); // 設定長方形以中心為基準
    app.fill(200, 200, 200); // 跑道顏色
    app.rect(getRelativeX(), getRelativeY(), width, height);
  }
}
