// @themoep
// based on Double Pendulum by Daniel Shiffman and inspired by film #3 by Joost Rekveld
// created during the art_machines .2 workshop at creative coding utrecht 2019-05-18

// TODO add frame numbers to screen
// TODO add loading of sessions?

import controlP5.*;
import java.util.ArrayList;

PGraphics canvas;

ArrayList<PGraphics> frames;
int currentFrameNum = -1;

String runId = String.format("%d-%2d-%2dT%2d%2d", year(), month(), day(), hour(), minute());


void setup() {
  size(900, 600, P2D);

  cx = width/2;
  cy = 200;

  frames = new ArrayList<PGraphics>();
  // FIXME: addFrame is called once by c4p apparently keep that in mind

  makeUI();
}

void draw() {
  background(10);
  displayPendulum();
  displayFrames();
}

void keyPressed() {
  switch(key) {
    case('c'): 
    newFrame(); 
    break;
    case('n'): 
    prevFrame(); 
    break;
    case('m'): 
    nextFrame(); 
    break;
    case('r'): 
    recToggle.toggle(); 
    break;
    case('h'):
    hideUI = !hideUI;
    if(hideUI) {
      cp5.hide();
    } else {
      cp5.show();
    }
    break;
  }
}
