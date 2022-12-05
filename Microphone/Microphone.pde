import processing.video.*;
import processing.sound.*;

AudioIn in;
Amplitude amp;
Movie mov;
WhiteNoise noise;

void setup(){
  size(560, 406);
  in = new AudioIn(this);
  in.start();
  amp = new Amplitude(this);
  amp.input(in);
  mov = new Movie(this, "launch2.mp4");
  mov.loop();
  noise = new WhiteNoise(this);
  noise.play();
}

void draw(){
  //println(amp.analyze());
  image(mov, 0, 0);
  float newSpeed = map(amp.analyze(), 0, 0.5, 0.1, 2);
  mov.speed(newSpeed);
  //println(newSpeed);
  float newVolume = map(amp.analyze(), 0, 0.5, 0.1, 1);
  noise.amp(newVolume);
  
  fill(255);
  textSize(24);
  text( nfc(newSpeed, 2) + " X", width - 110, 30);
}

void movieEvent(Movie m){
  m.read();
}
