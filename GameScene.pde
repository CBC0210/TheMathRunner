// 遊戲場景的基本結構
class GameScene extends Scene {
  PApplet app;
  int armyCount;
  Button[] optionButtons;
  Enemy enemy;
  
  GameScene(PApplet app) {
    super(app);
    this.app = app;
    this.armyCount = 10; // 初始軍隊數量，可根據需求調整
    
    // 初始化選項按鈕
    optionButtons = new Button[2];
    optionButtons[0] = new Button(app, "X + 5", app.width / 4, app.height - 100);
    optionButtons[1] = new Button(app, "X * 2", 3 * app.width / 4, app.height - 100);
    
    // 初始化敵人
    enemy = new Enemy(app, 15, app.width / 2, app.height / 2);
  }
  
  void display() {
    app.background(100);
    app.textAlign(CENTER);
    app.textSize(24);
    app.fill(255);
    app.text("軍隊人數: " + armyCount, app.width / 2, 50);
    
    // 顯示選項按鈕
    for (Button button : optionButtons) {
      button.display();
    }
    
    // 顯示敵人
    enemy.display();
  }
  
  void handleMousePressed(int mouseX, int mouseY) {
    // 檢查選項按鈕是否被點擊
    if (optionButtons[0].isClicked(mouseX, mouseY)) {
      armyCount += 5; // X + 5
    } else if (optionButtons[1].isClicked(mouseX, mouseY)) {
      armyCount *= 2; // X * 2
    }
    
    // 檢查是否遇到敵人並處理互動
    if (enemy.isEncountered(armyCount)) {
      armyCount -= enemy.enemyCount;
      if (armyCount < 0) {
        armyCount = 0; // 確保軍隊數量不會低於 0
      }
    }
  }
  
  void handleKeyPressed(char key) {
    // 處理按鍵事件（如果需要）
  }
}
