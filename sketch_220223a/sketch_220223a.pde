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
PImage img,img2,img3;//photos
PFont albatros;
PFont Bebas;
int writingX; //my name
int balloon1X;
int balloon2X;
int balloon3X;
int counter; //colour changing

//bouncing
int x, vx;
int y,vy;


void setup() {
  size(800, 800, P2D);
  writingX= 0;
  balloon1X=0;
  balloon2X=0;
  balloon3X=0;
  counter = 0;
  albatros = createFont("Albatros.ttf", 50);
  Bebas = createFont("BebasNeue-Regular.ttf", 50);
 
 //bouncig
  x= 0;
  y=300;
  vx=5;
  vy=5;


  //photo
  //closed card - https://www.rainbowenvelopes.co.uk/grey-148mm-x-210mm-a6-long-edge-235gsm-folded-card-blank.html
  img = loadImage("closed-card.jpg");//starting
  
  //open card -https://www.google.com/search?q=birthday+card+open&tbm=isch&ved=2ahUKEwjNpojyn5n2AhVIHjQIHZwrCGkQ2-cCegQIABAA&oq=birthday+card+open&gs_lcp=CgNpbWcQAzIHCCMQ7wMQJzIFCAAQgAQyBQgAEIAEMgYIABAFEB4yBAgAEBg6BggAEAgQHlCUFljnHGCAH2gAcAB4AIABaYgBtAKSAQM0LjGYAQCgAQGqAQtnd3Mtd2l6LWltZ8ABAQ&sclient=img&ei=9fMXYo3YE8i80PEPnNegyAY&bih=821&biw=1440#imgrc=8oJh6HrLYm6KzM
  img2 = loadImage("open-card.jpg");//last part of card
  
  img3=loadImage("Workingout.jpg");//ending - me working out photo
  
  
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
  
 
  
  pushMatrix(); // everything after card goes flips open
  if (frameCount>820){
   
  //bounce
  fill(255,227,8); 
  ellipse(x,y,20,20);    
  
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
 
textSize(50);
textAlign(CENTER,CENTER);
textFont(albatros);
fill(0);
text(" I wish you a wonderful birthday,", 400,200);
text(" filled with a year of happiness and joy.", 400,300);

 text ("Thank you for watching my animation,",400,400);
 text ("I hope that you enjoyed!", 400, 500);

 textSize(25);
 text ("By Max Dodek",400,700);
 
 }     
popMatrix();
  writing(writingX, 400);
  writingX= writingX + 1;

  balloon1(60, balloon1X);
  balloon1X= balloon1X + 1;
  
  balloon2(300, balloon2X);
  balloon2X= balloon2X - 1;

  balloon3(600, balloon3X);
  balloon3X= balloon3X + 1;

//Netflix screen
  pushMatrix();
if (frameCount>2200) {
background(255);
 fill(0);
 rect(200,200,400,400);
 textSize(100);
 textFont(Bebas);
 textAlign(CENTER,CENTER);
 fill(255,0,0);
 text("Netflix", 400, 300);
  fill(255);
 textSize(50);
 text("$25 Gift Card", 400,450);
}
  popMatrix();
   


//final ending
if (frameCount>2800){
background(255);
textSize(75);
image(img3, 100,100,600,600);
text("Thanks for Watching", 400, 100);
text("I hope you enjoyed!", 400, 800);
}
 
}




void writing (int x, int y) {
  pushMatrix();
  translate(x, y);
  fill(0);
  rect(0, -60, 375, 100);
  textSize(50);
  //textAlign(CENTER,CENTER);
  fill(255);
  text("Happy Birthday!!!", 0, 0);
  popMatrix();

}

void balloon1 (int x, int y) {
  if(frameCount>820){
pushMatrix();
translate (x,y);
fill(255,0,0);
ellipse(0,0,50,60);
line(0,30,0,80);

if (balloon1X > 900) {
 balloon1X = -10; 
}
popMatrix();
}
}

void balloon2(int x, int y) {
    if(frameCount>820){
pushMatrix();
translate (x,y);
fill(33,255,0);
ellipse(30,-80,50,60);
line(30,-50,30,0);

if (balloon2X < -10) {
 balloon2X = 900; 
}
popMatrix();
}
}
void balloon3(int x, int y) {
  
  if(frameCount>820){

pushMatrix();
translate (x,y);
fill(255,0,0);
ellipse(0,0,50,60);
line(0,30,0,80);

if (balloon3X > 900) {
 balloon3X = -10; 
}
popMatrix();
}
}
