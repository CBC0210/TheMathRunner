import processing.core.*;
import processing.event.*;

PApplet app;
Scene currentScene;
HomeScreen homeScreen;
LevelSelection levelSelection;
GameScene gameScene;
ResultScreen resultScreen;
Camera camera;

void setup() {
  fullScreen(); // 設定全螢幕，適應不同螢幕大小
  app = this;
  
  // 初始化攝影機
  camera = new Camera(app, width / 2, height / 2);
  
  // 初始化各場景
  homeScreen = new HomeScreen(app);
  levelSelection = new LevelSelection(app);
  gameScene = new GameScene(app);
  resultScreen = new ResultScreen(app);
  
  // 預設顯示首頁場景
  currentScene = homeScreen;
}

void draw() {
  camera.begin();
  // 更新當前場景的懸停狀態
  currentScene.updateHoverStates(mouseX, mouseY);
  // 顯示當前場景
  currentScene.display();
  camera.end();
}

void mousePressed() {
  // 將滑鼠點擊位置轉換為世界座標
  PVector worldMouse = camera.screenToWorld(mouseX, mouseY);
  // 傳遞滑鼠點擊事件給當前場景
  currentScene.handleMousePressed((int) worldMouse.x, (int) worldMouse.y);
}

void keyPressed() {
  // 傳遞按鍵事件給當前場景（如果需要）
  currentScene.handleKeyPressed(key);
}
