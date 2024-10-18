import processing.core.*;
import processing.sound.*;

// 按鈕類別的基本結構
class Button {
  PApplet app;
  String label;
  float x, y;
  float width = 200;
  float height = 40;
  boolean isHovered;
  SoundFile clickSound;
  Camera camera;
  
  Button(PApplet app, String label, float x, float y, Camera camera) {
    this.app = app;
    this.label = label;
    this.x = x;
    this.y = y;
    this.camera = camera;
    this.isHovered = false;
    // 初始化按下按鈕的音效（需要將音效文件存於 data 目錄）
    //clickSound = new SoundFile(app, "data/sounds/click.mp3");
  }
  
  void display() {
    float adjustedX = x + camera.x;
    float adjustedY = y + camera.y;
    if (isHovered) {
      app.fill(200); // 當滑鼠懸停時的顏色
    } else {
      app.fill(255);
    }
    app.rectMode(CENTER);
    app.rect(adjustedX, adjustedY, width, height);
    app.fill(0);
    app.textAlign(CENTER, CENTER);
    app.text(label, adjustedX, adjustedY);
  }
  
  void updateHoverState(int mouseX, int mouseY) {
    float adjustedX = x + camera.x;
    float adjustedY = y + camera.y;
    isHovered = mouseX > adjustedX - width / 2 && mouseX < adjustedX + width / 2 && mouseY > adjustedY - height / 2 && mouseY < adjustedY + height / 2;
  }
  
  void playClickSound() {
    if (clickSound != null) {
      clickSound.play();
    }
  }
  
  boolean isClicked(int mouseX, int mouseY) {
    float adjustedX = x + camera.x;
    float adjustedY = y + camera.y;
    if (mouseX > adjustedX - width / 2 && mouseX < adjustedX + width / 2 && mouseY > adjustedY - height / 2 && mouseY < adjustedY + height / 2) {
      //playClickSound();
      return true;
    }
    return false;
  }
}
