// 玩法説明頁面的基本結構
class HowToPlayScreen extends Scene {
  void updateHoverStates(int mouseX, int mouseY) {
    backButton.updateHoverState(mouseX, mouseY);
  }
  PApplet app;
  Button backButton;
  
  HowToPlayScreen(PApplet app) {
    super(app);
    this.app = app;
    
    // 初始化返回按鈕
    backButton = new Button(app, "返回", 0, app.height / 2 - 100);
  }
  
  void display() {
    app.background(100);
    app.textAlign(CENTER);
    app.textSize(24);
    app.fill(255);
    app.text("玩法説明", 0, -app.height / 2 + 50);
    
    app.textSize(16);
    app.text("1. 控制你的軍隊，選擇合適的選項來增加軍隊人數。", 0, -app.height / 2 + 150);
    app.text("2. 與敵人對抗，確保至少有一人能到達終點。", 0, -app.height / 2 + 200);
    app.text("3. 根據提示進行選擇，完成每個關卡的挑戰。", 0, -app.height / 2 + 250);
    
    // 顯示返回按鈕
    backButton.display();
  }
  
  void handleMousePressed(int mouseX, int mouseY) {
    // 檢查返回按鈕是否被點擊
    if (backButton.isClicked(mouseX, mouseY)) {
      currentScene = homeScreen; // 返回首頁場景
    }
  }
  
  void handleKeyPressed(char key) {
    // 處理按鍵事件（如果需要）
  }
}
