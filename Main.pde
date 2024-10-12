import processing.core.*;
import processing.event.*;

PApplet app;
Scene currentScene;
HomeScreen homeScreen;
LevelSelection levelSelection;
GameScene gameScene;
ResultScreen resultScreen;

void setup() {
  size(800, 600); // 設定畫布大小，可根據需求調整
  app = this;
  
  // 初始化各場景
  homeScreen = new HomeScreen(app);
  levelSelection = new LevelSelection(app);
  gameScene = new GameScene(app);
  resultScreen = new ResultScreen(app);
  
  // 預設顯示首頁場景
  currentScene = homeScreen;
}

void draw() {
  // 顯示當前場景
  currentScene.display();
}

void mousePressed() {
  // 傳遞滑鼠點擊事件給當前場景
  currentScene.handleMousePressed(mouseX, mouseY);
}

void keyPressed() {
  // 傳遞按鍵事件給當前場景（如果需要）
  currentScene.handleKeyPressed(key);
}
