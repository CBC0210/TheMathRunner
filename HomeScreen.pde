// 主場景（首頁場面）的基本結構
class HomeScreen extends Scene {
  PApplet app;
  Camera camera;
  Button startButton;
  Button howToPlayButton;
  Button creditsButton;
  Button exitButton;

  HomeScreen(PApplet app, Camera camera) {
    super(app);
    this.app = app;
    this.camera = camera;
    
    // 初始化按鈕
    startButton = new Button(app, "開始遊戲", 0, -60, camera);
    howToPlayButton = new Button(app, "玩法説明", 0, 0, camera);
    creditsButton = new Button(app, "版權聲明", 0, 60, camera);
    exitButton = new Button(app, "退出遊戲", 0, 120, camera);
  }

  void display() {
    app.background(200);
    app.textAlign(CENTER);
    app.textSize(32);
    app.fill(0);
    app.text("主頁面", camera.x, camera.y - 200);

    // 顯示按鈕
    startButton.display();
    howToPlayButton.display();
    creditsButton.display();
    exitButton.display();
  }

  void handleMousePressed(int mouseX, int mouseY) {
    // 檢查按鈕是否被點擊
    if (startButton.isClicked(mouseX, mouseY)) {
      currentScene = levelSelection; // 切換到選關界面
    } else if (howToPlayButton.isClicked(mouseX, mouseY)) {
      currentScene = new HowToPlayScreen(app,camera); // 切換到玩法説明界面
    } else if (creditsButton.isClicked(mouseX, mouseY)) {
      currentScene = new CreditsScreen(app,camera); // 切換到版權聲明界面
    } else if (exitButton.isClicked(mouseX, mouseY)) {
      app.exit(); // 退出遊戲
    }
  }

  void handleKeyPressed(char key) {
    // 處理按鍵事件（如果需要）
  }

  void updateHoverStates(int mouseX, int mouseY) {
    // 更新每個按鈕的懸停狀態
    startButton.updateHoverState(mouseX, mouseY);
    howToPlayButton.updateHoverState(mouseX, mouseY);
    creditsButton.updateHoverState(mouseX, mouseY);
    exitButton.updateHoverState(mouseX, mouseY);
  }
}
