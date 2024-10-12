// 按鈕類別的基本結構
class Button {
  PApplet app;
  String label;
  float x, y;
  float width = 200;
  float height = 40;
  
  Button(PApplet app, String label, float x, float y) {
    this.app = app;
    this.label = label;
    this.x = x;
    this.y = y;
  }
  
  void display() {
    app.fill(255);
    app.rectMode(CENTER);
    app.rect(x, y, width, height);
    app.fill(0);
    app.textAlign(CENTER, CENTER);
    app.text(label, x, y);
  }
  
  boolean isClicked(int mouseX, int mouseY) {
    return mouseX > x - width / 2 && mouseX < x + width / 2 && mouseY > y - height / 2 && mouseY < y + height / 2;
  }
}
