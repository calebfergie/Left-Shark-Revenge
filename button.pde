class Button {
  float x;
  float y;
  float xWidth;
  float yHeight;
  String name;
  boolean status;
  String onName;
  String offName;

  Button(float x_, float y_, float xWidth_, float yHeight_, String name_, boolean status_, String onName_, String offName_) {
    x = x_;
    y = y_;
    xWidth = xWidth_;
    yHeight = yHeight_;
    name = name_;
    status=status_;
    onName=onName_;
    offName = offName_;
  }

  boolean inRange(float mousex, float mousey) {
    if (mousex > x && mousex < (x + xWidth) && mousey > y && mousey < (y + yHeight)) {
      return true;
    } else {
      return false;
    }
  }

  void show() {
    //fill(255); //for testing where the box is
      //rect(x, y, xWidth, yHeight);
    if (status == false) {
      text(onName, x, y);
    } else {
      text(offName, x, y);
    }
  }
}
