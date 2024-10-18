import processing.core.*;
import processing.event.*;

PApplet app;
int relativeMouseX;
int relativeMouseY;
PFont notoFont;
Scene currentScene;
HomeScreen homeScreen;
LevelSelection levelSelection;
GameScene gameScene;
ResultScreen resultScreen;
Camera camera;

void setup() {
    fullScreen(); // 設定全螢幕，適應不同螢幕大小
  app = this;
  
  // 載入字體
  notoFont = createFont("data/fonts/NotoSansTC-Regular.ttf", 32);
  textFont(notoFont);
  
  // 初始化攝影機
  camera = new Camera(app, width / 2, height / 2);
  
  // 初始化各場景
  homeScreen = new HomeScreen(app);
  levelSelection = new LevelSelection(app);
  resultScreen = new ResultScreen(app);
  
  // 預設顯示首頁場景
  currentScene = homeScreen;
}

void draw() {
  // 計算相對於世界的滑鼠座標
  relativeMouseX = (int)((mouseX - camera.x) / camera.zoom);
  relativeMouseY = (int)((mouseY - camera.y) / camera.zoom);
  camera.begin();
  // 更新當前場景的懸停狀態
  currentScene.updateHoverStates(relativeMouseX, relativeMouseY);
  // 顯示當前場景
  currentScene.display();
  camera.end();
}

void mousePressed() {
  currentScene.handleMousePressed(relativeMouseX, relativeMouseY);
}

void keyPressed() {
  // 傳遞按鍵事件給當前場景（如果需要）
  currentScene.handleKeyPressed(key);
}
