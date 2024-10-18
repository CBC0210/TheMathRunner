// 選關界面場景的基本結構
class LevelSelection extends Scene {
  PApplet app;
  Button[] levelButtons;
  
  LevelSelection(PApplet app) {
    super(app);
    this.app = app;
    
    // 初始化關卡按鈕
    levelButtons = new Button[3];
    levelButtons[0] = new Button(app, "關卡 1", 0, 150);
    levelButtons[1] = new Button(app, "關卡 2", 0, 200);
    levelButtons[2] = new Button(app, "關卡 3", 0, 250);
    
  }
  
  void display() {
    app.background(150);
    app.textAlign(CENTER);
    app.textSize(24);
    app.fill(0);
    app.text("選擇關卡", 0, -app.height / 2 + 50);
    
    // 顯示每個關卡按鈕
    for (Button button : levelButtons) {
      button.display();
    }
  }
  
  void handleMousePressed(int mouseX, int mouseY) {
    // 檢查每個按鈕是否被點擊
    for (int i = 0; i < levelButtons.length; i++) {
      if (levelButtons[i].isClicked(mouseX, mouseY)) {
        currentScene = new GameScene(app,0); // 切換到遊戲場景（可以根據所選關卡進行特定設置）
      }
    }
  }
  
  void updateHoverStates(int mouseX, int mouseY) {
      for (int i = 0; i < levelButtons.length; i++) {
        levelButtons[i].updateHoverState(mouseX,mouseY);
    } //<>//
  }
  
  void handleKeyPressed(char key) {
    // 處理按鍵事件（如果需要）
  }
  
}
