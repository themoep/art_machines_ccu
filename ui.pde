ControlP5 cp5;

RadioButton radio;
Slider2D s;

Button newFButton;
Button nextFButton;
Button prevFButton;
Toggle recToggle;

float speed = 1.0;
float rotation = 0;
float focus = 5.0;

boolean drawPendulum = true;
boolean record = false;

color lightColor = color(255);

void makeUI() {
  cp5 = new ControlP5(this);

  Toggle t = cp5.addToggle("drawPendulum")
    .setPosition(30, 10)
    .setSize(30, 10)
    ;

  //t.getCaptionLabel().setVisible(false);

  cp5.addSlider("speed")
    .setPosition(30, 30+10)
    .setRange(0.0, 15)
    ;

  cp5.addSlider("rotation")
    .setPosition(30, 30+10+20)
    .setRange(0.0, 2*PI)
    ;

  s = cp5.addSlider2D("position")
    .setPosition(30, 50+10+20)
    .setSize(99, 99)
    .setMinMax(0, 0, width, height)
    .setValue(width/2, height/2)
    //.disableCrosshair()
    ;

  radio = cp5.addRadioButton("radio")
    .setPosition(30, 180+20)
    .setItemWidth(20)
    .setItemHeight(20)
    .addItem("purple", 0)
    .addItem("red", 1)
    .addItem("yellow", 2)
    .addItem("green", 3)
    .addItem("blue", 4)
    .setColorLabel(color(255))
    ;

  cp5.addSlider("focus")
    .setPosition(30, 320)
    .setRange(1.0, 10)
    ;

  recToggle = cp5.addToggle("record")
    .setPosition(30, 340)
    .setSize(30, 30)
    ;

  newFButton = cp5.addButton("newFrame")
    .setValue(0)
    .setPosition(30, 390)
    .setSize(70, 15)
    ;
    
  nextFButton = cp5.addButton("prevFrame")
    .setValue(0)
    .setPosition(30, 410)
    .setSize(70, 15)
    ;
  
  prevFButton = cp5.addButton("nextFrame")
    .setValue(0)
    .setPosition(30, 430)
    .setSize(70, 15)
    ;
    
  newFButton = cp5.addButton("saveAllFrames")
    .setValue(0)
    .setPosition(30, 450)
    .setSize(70, 25)
    ;
}


void controlEvent(ControlEvent theEvent) {
  if (theEvent.isFrom(radio)) {
    switch(int(theEvent.getGroup().getValue())) {
    case 0:
      //purple
      lightColor = color(#D82EFF);
      break;
    case 1:
      //red
      lightColor = color(#FF2E40);
      break;
    case 2:
      //yellow
      lightColor = color(#EEFF0D);
      break;
    case 3:
      //green
      lightColor = color(#00C622);
      break;
    case 4:
      //blue
      lightColor = color(#4BCDFF);
      break;
    case -1:
      lightColor = color(255);
      break;
    }
  }
}
