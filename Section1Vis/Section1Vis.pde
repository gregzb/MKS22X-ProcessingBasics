import processing.sound.*;

int MAX_VALUE = 100;
int MIN_VALUE = -100;
Visualizer v;

AudioInputManager auin;

/*You are simulating a visualizer of multiple values
 You need to create a display method first. 
 Then you can make a method that changes the values each time the update is called. 
 */
class Visualizer {
  float x, y;
  float [] values;
  float [] speeds;
  
  float boxWidth = 400;
  //int boxHeight = 200;
  int boxHeight = MAX_VALUE - MIN_VALUE;
  
  Visualizer(float x, float y) {
    this.x = x;
    this.y = y;
    values = new float[512];
    speeds = new float[512];
    for (int i = 0; i < values.length; i++) {
      values[i] = random(-99, 99);
      speeds[i] = random(2);
    }
  }

  void display() {
    //draw the bars equally spaced inside this box. 
    //You can assume 10, but it would be even better 
    //if you could modify it to be larger increments.
    
    float midY = y + boxHeight / 2;
    
    float singleBoxWidth = boxWidth / (values.length);
    
    //rectangle
    fill(255);
    rect(x, y, boxWidth, boxHeight);
    
    //middle line
    line(x, midY, x+boxWidth, midY);
    
    for (int i = 0; i < values.length; i++) {
      float value = values[i];
      
      if (value >= 50) fill(0, 255, 0);
      else if (value >= 0) fill(255, 255, 0);
      else if (value >= -50) fill(255, 127, 0);
      else fill(255, 0, 0);
      
      rect(x + (i * singleBoxWidth), midY, singleBoxWidth, -value);
    }


    //Width of the visualizer is 400!

  
  }
  void update() {
    //???WRITE THIS METHOD SECOND!!!
    //for (int i = 0; i < values.length; i++) {
    //  values[i] += speeds[i]; 
      
    //  if (values[i] > MAX_VALUE) {
    //    values[i] = MAX_VALUE;
    //    speeds[i] = -speeds[i];
    //  } else if (values[i] < MIN_VALUE) {
    //    values[i] = MIN_VALUE;
    //    speeds[i] = -speeds[i];
    //  }
      
    //}
    
    values = auin.getSpectrum();
  }
}

void setup() {
  size(600, 500);
  v = new Visualizer(20, 20);
  
  delay(400);
  
  auin = new AudioInputManager();
}
void draw() {
  background(255);
  v.display();
  v.update();
  auin.updatePitch();
}
