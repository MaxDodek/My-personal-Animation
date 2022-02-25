//Max Dodek
//2.3
//Feb. 23, 2022



//don't need to memorize this, this just does this for me, so that I can make music
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//needs these two variables

Minim minim; // make object represent minim, so that I can use this
AudioPlayer song; // stores song
PImage img,img2;//photos
int writingX; //my name
int counter; //colour changing

//bouncing
int x, vx;
int y,vy;


void setup() {
  size(800, 800, P2D);
  writingX= 0;
  counter = 0;
 
 //bouncig
  x= 0;
  y=300;
  vx=5;
  vy=5;


  //photo
  //closed card - https://www.rainbowenvelopes.co.uk/grey-148mm-x-210mm-a6-long-edge-235gsm-folded-card-blank.html
  img = loadImage("closed-card.jpg");//starting
  
  //open card -https://www.google.com/search?q=birthday+card+open&tbm=isch&ved=2ahUKEwjNpojyn5n2AhVIHjQIHZwrCGkQ2-cCegQIABAA&oq=birthday+card+open&gs_lcp=CgNpbWcQAzIHCCMQ7wMQJzIFCAAQgAQyBQgAEIAEMgYIABAFEB4yBAgAEBg6BggAEAgQHlCUFljnHGCAH2gAcAB4AIABaYgBtAKSAQM0LjGYAQCgAQGqAQtnd3Mtd2l6LWltZ8ABAQ&sclient=img&ei=9fMXYo3YE8i80PEPnNegyAY&bih=821&biw=1440#imgrc=8oJh6HrLYm6KzM
  img2 = loadImage("open-card.jpg");//ending
  
  //music
  minim = new Minim (this);
  song = minim.loadFile("Miami_song.mp3");
  song.play();
}


void draw () {


  background(255);

  if (frameCount < 800) {
    image(img, 100, 100, 600, 600);
  }
  if (frameCount>820){
    image(img2, 100, 100, 600, 600);
  }
  
  pushMatrix();
  if (frameCount>820){
    
  //  //change colour
  // counter = counter + 1;
   
  // if (counter < 100) {
  // fill(255,227,8); 
  // ellipse(0,0,20,20);
  // }
  //  if (counter > 100) {
  // fill(255); 
  // ellipse(0,0,20,20);
   
   
  //  if (counter == 100) {
  //  counter = 0;
  //}
  
  
  //bounce
  ellipse(0,0,20,20);
    x= x +vx;
  if (x > 750) {
    vx=-5;
  }
  if (x<50){
   vx=5;
  }
  
    y= y +vy;
  if (y > 750) {
    vy =-5;
  }
  if (y<50){
   vy=5;
  }
   }
  
  
  
   }
  
  popMatrix();




  writing(writingX, 400);
  writingX= writingX + 1;


}

void writing (int x, int y) {
  pushMatrix();
  translate(x, y);
  fill(0);
  rect(0, -60, 300, 100);
  textSize(50);
  //textAlign(CENTER,CENTER);
  fill(255);
  text("By Max Dodek", 0, 0);
  popMatrix();
}
