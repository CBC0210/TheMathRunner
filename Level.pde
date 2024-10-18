// Level 類別，包含 SubLevel 陣列
class Level {
  SubLevel[] subLevels;

  Level() {
    subLevels = new SubLevel[3];
    for (int i = 0; i < subLevels.length; i++) {
      subLevels[i] = new SubLevel();
    }
  }
  

}

// SubLevel 類別，包含敵人血量和選項陣列
class SubLevel {
  int enemyHp;
  Option[] options;

  SubLevel() {
    enemyHp = 100; // 預設敵人血量
    options = new Option[3];
    for (int i = 0; i < options.length; i++) {
      options[i] = new Option();
    }
  }
}

// Option 類別，包含兩個選項字串
class Option {
  String opt1;
  String opt2;

  Option() {
    opt1 = "選項 1";
    opt2 = "選項 2";
  }
}

class LevelUtils {
  
  // 靜態方法來讀取關卡數據
  Level[] loadLevels(PApplet app, String filePath) {
    // 讀取關卡數據
    String levelFilePath = filePath;
    JSONObject levelJson = app.loadJSONObject(levelFilePath);
    Level[] levels = new Level[levelJson.getJSONArray("levels").size()];
    JSONArray levelArray = levelJson.getJSONArray("levels");
    for (int i = 0; i < levelArray.size(); i++) {
      JSONObject levelObjJson = levelArray.getJSONObject(i);
      Level levelObj = new Level();
      for (int j = 0; j < 3; j++) {
        SubLevel subLevel = new SubLevel();
        subLevel.enemyHp = levelObjJson.getJSONArray("subLevels").getJSONObject(j).getInt("enemyHp");
        JSONArray optionsArray = levelObjJson.getJSONArray("subLevels").getJSONObject(j).getJSONArray("options");
        for (int k = 0; k < 3; k++) {
          Option option = new Option();
          option.opt1 = optionsArray.getJSONObject(k).getString("opt1");
          option.opt2 = optionsArray.getJSONObject(k).getString("opt2");
          subLevel.options[k] = option;
        }
        levelObj.subLevels[j] = subLevel;
      }
      levels[i] = levelObj;
    }

    return levels;
  }
}
