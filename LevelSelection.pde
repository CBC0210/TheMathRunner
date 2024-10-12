// 選關界面場景的基本結構
class LevelSelection extends Scene {
  PApplet app;
  Button[] levelButtons;
  
  LevelSelection(PApplet app) {
    super(app);
    this.app = app;
    
    // 初始化關卡按鈕
    levelButtons = new Button[3];
    levelButtons[0] = new Button(app, "關卡 1", app.width / 2, 150);
    levelButtons[1] = new Button(app, "關卡 2", app.width / 2, 200);
    levelButtons[2] = new Button(app, "關卡 3", app.width / 2, 250);
  }
  
  void display() {
    app.background(150);
    app.textAlign(CENTER);
    app.textSize(24);
    app.fill(0);
    app.text("選擇關卡", app.width / 2, 50);
    
    // 顯示每個關卡按鈕
    for (Button button : levelButtons) {
      button.display();
    }
  }
  
  void handleMousePressed(int mouseX, int mouseY) {
    // 檢查每個按鈕是否被點擊
    for (int i = 0; i < levelButtons.length; i++) {
      if (levelButtons[i].isClicked(mouseX, mouseY)) {
        currentScene = gameScene; // 切換到遊戲場景（可以根據所選關卡進行特定設置）
      }
    }
  }
  
  void handleKeyPressed(char key) {
    // 處理按鍵事件（如果需要）
  }
}
