boolean hideUI = false;


void displayFrames() {
  if(hideUI) {
    return;
  }
  
  //draw current frame in the middle
  fill(10);
  noStroke();
  rect(4*112, height-75, 112, 75);
  image((PGraphics)frames.get(currentFrameNum), 4*112, height-75, 112, 75);
  noFill();
  stroke(255, 0, 0);
  rect(4*112, height-76, 111, 75);
  
  //draw following frames until out of screen
  
  int framesAfter = min(4, frames.size()-currentFrameNum-1);
  
  for (int i = 0; i < framesAfter; i++) {
    fill(10);
    noStroke();
    rect((i+5)*112, height-75, 112, 75);
    image((PGraphics)frames.get(i+1+currentFrameNum), (i+5)*112, height-75, 112, 75);
  }
  
  //draw previous frames until out of screen
  
  for (int i = 3; i >= 0; i--) {
    if(currentFrameNum-(3-i+1) < 0) {
      break;
    }
    fill(10);
    noStroke();
    rect((i)*112, height-75, 112, 75);
    image((PGraphics)frames.get(currentFrameNum-(3-i+1)), (i)*112, height-75, 112, 75);
  }
}


// FIXME: called apparently by c4p once in setup??
void newFrame() {
  PGraphics tmp = createGraphics(width, height, P2D);
  tmp.beginDraw();
  tmp.background(10);
  tmp.endDraw();
  frames.add(tmp);
  canvas = tmp;

  currentFrameNum = frames.size()-1;
}

void nextFrame() {
  if ((currentFrameNum+1)>=frames.size()) {
    currentFrameNum = 0;
  } else {
    currentFrameNum++;
  }
  canvas = frames.get(currentFrameNum);
}

void prevFrame() {
  if ((currentFrameNum-1)<0) {
    currentFrameNum = frames.size()-1;
  } else {
    currentFrameNum--;
  }
  canvas = frames.get(currentFrameNum);
}

void saveAllFrames() {
  for (int i = 0; i < frames.size(); i++) {
    PGraphics frame =frames.get(i);
    frame.save(String.format("f_%s_%3d.tif", runId, i));
  }
}
