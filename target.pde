class Target {
  int xCenter;
  int yCenter;
  int size;
  int alpha;
  boolean visible;

  Target(int x_, int y_, int size_, boolean visibility_) {
    xCenter = x_;
    yCenter = y_;
    size = size_;
    visible = visibility_;
  }


  void display(int alpha, String side) {
    if (visible==true) {
      stroke(0);
      fill(alpha, 0, 255, alpha);
      strokeWeight(int(alpha/50));
      ellipse(xCenter, yCenter, size, size);
      fill(0);
      textAlign(CENTER,CENTER);
      text(side, xCenter, yCenter);
    }
  }

  void move(int x, int y) {
    xCenter = x;
    yCenter = y;
    visible = true;
  }

  PVector getCenter() {
    float x = xCenter;
    float y = yCenter;    
    return new PVector(x, y);
  }

  //grading based on proportions listed here: https://www.reddit.com/r/DanceDanceRevolution/comments/4ay7kh/marvelousperfect_timing_windows/
  int grade(float windowStart, float currentTime, float windowLength) {
  int evaluation;
  float miss = abs(currentTime - windowStart); //distance from perfection
  if (tpb > 1000) {
  if (miss < windowLength/4.8) {evaluation = 4;} else if (miss < windowLength/3.2) {evaluation = 3;} else if (miss < windowLength/1.6) {evaluation = 2;}
  else if (miss < windowLength/1.2) {evaluation = 1;} else {evaluation = 0;};
  } else  {
  if (miss < windowLength/1.6) {evaluation = 4;} else if (miss < windowLength/1.4) {evaluation = 3;} else if (miss < windowLength/1.2) {evaluation = 2;}
  else if (miss < windowLength/1.1) {evaluation = 1;} else {evaluation = 0;};
  }
  
  return evaluation;
}


  void hide() {
    visible = false; 
    xCenter=-100; 
    yCenter=-100;
  } //hide it from draw and change its position temporarily

  boolean stillThere() {
    return visible;
  }
}
