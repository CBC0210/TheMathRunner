// 抽象場景類別的基本結構
abstract class Scene {
  PApplet app;
  
  Scene(PApplet app) {
    this.app = app;
  }
  
  // 抽象方法，由子類別實作
  abstract void display();
  abstract void handleMousePressed(int mouseX, int mouseY);
  abstract void handleKeyPressed(char key);
}
