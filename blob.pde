// Daniel Shiffman
// Adapted from improved blobs example by D. Schiffman
// http://codingtra.in
// http://patreon.com/codingtrain
// Code for: https://youtu.be/r0lvsMPGEoY

int[] numbers = { 90, 150, 30 };  // Alternate syntax

class Blob {
  float minx;
  float miny;
  float maxx;
  float maxy;
      
  int id = 0;
  
  boolean taken = false;

  Blob(float x, float y) {
    minx = x;
    miny = y;
    maxx = x;
    maxy = y;
  }
    
  void show() {
    stroke(0);
    fill(255, 100);
    strokeWeight(2);
    rectMode(CORNERS);
    rect(minx, miny, maxx, maxy);
    fill(0);
    textAlign(CENTER,CENTER);
    text(id, maxx, maxy); //manual based on size
  }


  void add(float x, float y) {
    minx = min(minx, x);
    miny = min(miny, y);
    maxx = max(maxx, x);
    maxy = max(maxy, y);
  }
  
  void become(Blob other) {
    minx = other.minx;
    maxx = other.maxx;
    miny = other.miny;
    maxy = other.maxy;
  }

  float size() {
    return (maxx-minx)*(maxy-miny);
  }
  
  PVector getCenter() {
    float x = (maxx - minx)* 0.5 + minx;
    float y = (maxy - miny)* 0.5 + miny;    
    return new PVector(x,y); 
  }

  boolean isNear(float x, float y) {

    float cx = max(min(x, maxx), minx);
    float cy = max(min(y, maxy), miny);
    float d = distSq(cx, cy, x, y);

    if (d < distThreshold*distThreshold) {
      return true;
    } else {
      return false;
    }
  }
}
