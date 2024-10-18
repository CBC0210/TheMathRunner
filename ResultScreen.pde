// 結算畫面場景的基本結構
class ResultScreen extends Scene {
  PApplet app;
  Button replayButton;
  Button nextLevelButton;
  
  ResultScreen(PApplet app) {
    super(app);
    this.app = app;
    
    // 初始化按鈕
    replayButton = new Button(app, "重玩此關", app.width / 3, app.height / 2);
    nextLevelButton = new Button(app, "下一關", 2 * app.width / 3, app.height / 2);
  }
  
  void display() {
    app.background(50);
    app.textAlign(CENTER);
    app.textSize(32);
    app.fill(255);
    app.text("關卡結束", app.width / 2, 100);
    
    // 顯示按鈕
    replayButton.display();
    nextLevelButton.display();
  }
  
  void handleMousePressed(int mouseX, int mouseY) {
    // 檢查按鈕是否被點擊
    if (replayButton.isClicked(mouseX, mouseY)) {
      currentScene = gameScene; // 重玩此關
    } else if (nextLevelButton.isClicked(mouseX, mouseY)) {
      // 邏輯可以根據遊戲進度進行調整，例如初始化下一關的設置
      currentScene = gameScene; // 進入下一關（目前用相同的遊戲場景作為示例）
    }
  }
  
  void updateHoverStates(int mouseX, int mouseY) {
  
  }
  
  void handleKeyPressed(char key) {
    // 處理按鍵事件（如果需要）
  }
}
