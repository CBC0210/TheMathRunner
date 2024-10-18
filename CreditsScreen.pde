// 版權聲明頁面的基本結構
class CreditsScreen extends Scene {
  PApplet app;
  Button backButton;
  
  CreditsScreen(PApplet app) {
    super(app);
    this.app = app;
    
    // 初始化返回按鈕
    backButton = new Button(app, "返回", 0,-100);
  }
  
  void display() {
    app.background(150);
    app.textAlign(CENTER);
    app.textSize(24);
    app.fill(255);
    app.text("版權聲明", 0, 50);
    
    app.textSize(16);
    app.text("遊戲開發團隊:", 0, 150);
    app.text("- 程式設計: Alice, Bob", 0, 200);
    app.text("- 美術設計: Charlie", 0, 230);
    app.text("- 音樂製作: Dave", 0, 260);
    app.text("感謝所有參與製作的人員。", 0, 320);
    
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
  
  void updateHoverStates(int mouseX, int mouseY) {
      backButton.updateHoverState(mouseX,mouseY);
  }
}
