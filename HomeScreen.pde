// 主場景（首頁場景）的基本結構
class HomeScreen extends Scene {
  HomeScreen(PApplet app) {
    super(app);
  }
  
  void display() {
    app.background(200);
    // 顯示按鈕及首頁內容
  }
  
  void handleMousePressed(int mouseX, int mouseY) {
    // 處理滑鼠按下事件，例如按鈕點擊
  }
  
  void handleKeyPressed(char key) {
    // 處理按鍵事件（如果需要）
  }
}
