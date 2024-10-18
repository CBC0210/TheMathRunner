import processing.data.JSONArray;
import processing.data.JSONObject;

// 遊戲場景的基本結構
import java.util.ArrayList;

class GameScene extends Scene {
  Player player;
  ArrayList<Field> fields;
  PApplet app;
  Level[] levels;
  
  GameScene(PApplet app, int level) {
    super(app);
    this.app = app;
    
    levels = new LevelUtils().loadLevels(app, "data/levels/level_" + level + ".json");
    player = new Player(app);  // 初始化玩家
    fields = new ArrayList<>();
    fields.add(new Field(app, player, 0, 0, app.width, app.height / 3));  // 初始化第一塊場地  // 初始化場地，設置滾動速度為 2.0
  }
  
  void display() {
    background(0);
    // 更新玩家位置
    player.update(relativeMouseX);
    player.y -= 2;  // 玩家 Y 坐標以固定速度減少，模擬向前移動

    // 更新場地
    for (int i = fields.size() - 1; i >= 0; i--) {
      Field f = fields.get(i);
      if (f.getRelativeY() > app.height) {
        fields.remove(i);  // 刪除距離玩家太遠的場地
      }
    }

    // 如果最後一個場地接近玩家，添加新的場地
    if (fields.size() > 0 && fields.get(fields.size() - 1).getRelativeY() > -app.height / 2) {
      fields.add(new Field(app, player, 0, fields.get(fields.size() - 1).y - app.height / 3, app.width, app.height / 3));
    }

    // 顯示場地
    for (Field f : fields) {
      f.display();
    }
    player.update(relativeMouseX);
    
    player.display();
  }
  
  void handleMousePressed(int mouseX, int mouseY) {

  }
  
  void handleKeyPressed(char key) {
    // 處理按鍵事件（如果需要）
  }

  void updateHoverStates(int mouseX, int mouseY) {
    // 更新選項按鈕的懸停狀態
  }
}
