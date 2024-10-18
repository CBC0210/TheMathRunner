// 攝影機類別的基本結構
class Camera {
  PApplet app;
  float x, y;
  float zoom;
  
  Camera(PApplet app, float startX, float startY) {
    this.app = app;
    this.x = startX;
    this.y = startY;
    this.zoom = 1.0;
  }
  
  void begin() {
    app.translate(x, y);
    app.scale(zoom);
  }
  
  void end() {
    app.resetMatrix();
  }
  
  void move(float dx, float dy) {
    x += dx;
    y += dy;
  }
  
  void setPosition(float newX, float newY) {
    x = newX;
    y = newY;
  }
  
  void setZoom(float newZoom) {
    zoom = newZoom;
  }
  
  void adjustZoom(float factor) {
    zoom *= factor;
  }
  
  PVector screenToWorld(float screenX, float screenY) {
    float worldX = (screenX - app.width / 2) / zoom + x;
    float worldY = (screenY - app.height / 2) / zoom + y;
    return new PVector(worldX, worldY);
  }
  
  PVector worldToScreen(float worldX, float worldY) {
    float screenX = (worldX - x) * zoom + app.width / 2;
    float screenY = (worldY - y) * zoom + app.height / 2;
    return new PVector(screenX, screenY);
  }
}
