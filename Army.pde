// 軍隊類別的基本結構
class Army {
  PApplet app;
  int armyCount;
  float x, y;
  
  Army(PApplet app, int initialCount, float x, float y) {
    this.app = app;
    this.armyCount = initialCount;
    this.x = x;
    this.y = y;
  }
  
  void display() {
    app.fill(0, 0, 255);
    app.ellipse(x, y, 50, 50);
    app.fill(255);
    app.textAlign(CENTER, CENTER);
    app.text("軍隊: " + armyCount, x, y);
  }
  
  void updateCount(int change) {
    armyCount += change;
    if (armyCount < 0) {
      armyCount = 0; // 確保軍隊數量不會低於 0
    }
  }

  boolean isDefeated() {
    return armyCount <= 0;
  }
}
