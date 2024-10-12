// 敵人類別的基本結構
class Enemy {
  PApplet app;
  int enemyCount;
  float x, y;
  
  Enemy(PApplet app, int enemyCount, float x, float y) {
    this.app = app;
    this.enemyCount = enemyCount;
    this.x = x;
    this.y = y;
  }
  
  void display() {
    app.fill(255, 0, 0);
    app.ellipse(x, y, 50, 50);
    app.fill(0);
    app.textAlign(CENTER, CENTER);
    app.text("敵人: " + enemyCount, x, y);
  }
  
  boolean isEncountered(int armyCount) {
    // 檢查是否遇到敵人，可以根據遊戲的具體需求來設計邏輯
    // 這裡我們假設只要軍隊經過敵人所在位置即會遭遇敵人
    return armyCount > 0; // 示例條件，可根據需求更改
  }
}
