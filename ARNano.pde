/**
 * NyARToolkit for proce55ing/3.0.5
 * (c)2008-2017 nyatla
 * airmail(at)ebony.plala.or.jp
 * 
 * ２つの座標系を同時に扱う例です。
 * 人マーカの上に右手系、Hiroマーカの上に左手系の座標系を使って、立方体を表示します。
 * 全ての設定ファイルとマーカファイルはスケッチディレクトリのlibraries/nyar4psg/dataにあります。
 * 
 * This sketch handles 2 coordinate system in same time.(left and right).
 * Each markers show different coordinate system.
 * The marker is "patt.hiro" and "patt.kanji"
 * Any pattern and configuration files are found in libraries/nyar4psg/data inside your sketchbook folder. 
 */
 
import processing.video.*;
import jp.nyatla.nyar4psg.*;

Capture cam;
PImage cSmall;
MultiMarker nya;
PFont font;
PShape one; //flower
PShape two; // Shell
PShape three; //fullerene -> charcoal
PShape four; //LDH
PShape five; //annular reactor
PShape six; //Li_Bowen_mSiO2_Ni
PShape seven; //MoS2_at_SiO2
PShape eight; //porous_nis-ni3s2_hollow_nanoparticle
PShape nine; //2000K0_5_triangles_cleaned
PShape ten; //titania4

void setup() {
  size(1280,720,P3D);
  font=createFont("FFScala", 32);
  colorMode(RGB, 100);
  println(MultiMarker.VERSION);
  one = loadShape("flower.obj");
  one.scale(150);  
  //one = loadShape("Cat.obj");
  //one.scale(2);
  two = loadShape("Shell.obj");
  two.scale(400);
  three = loadShape("giantfullerne.obj");
  three.scale(70);
  four = loadShape("LDH_v2.OBJ");
  four.scale(90);
  five = loadShape("annular_reactor_v4.OBJ");
  five.scale(40);
  six = loadShape("Li_Bowen_mSiO2_Ni.obj");
  six.scale(400);
  seven = loadShape("MoS2_at_SiO2.obj");
  seven.scale(600);
  eight = loadShape("porous_nis-ni3s2_hollow_nanoparticle.obj");
  eight.scale(1700);
  nine = loadShape("2000K0_5_triangles_cleaned.obj");
  nine.scale(250);
  ten = loadShape("titania4.obj");
  ten.scale(100);
  
  
  //キャプチャを作成
  String[] cameras = Capture.list();
  printArray(cameras);
  cam=new Capture(this,1280,720); // default webcam
  //cam=new Capture(this,1280,720,"Logitech HD Webcam C270");
  //cam=new Capture(this,cameras[111]);// on hp laptop with logitech camera
  nya = new MultiMarker(this,width,height,"camera_para.dat",NyAR4PsgConfig.CONFIG_PSG);
  nya.addNyIdMarker(0,80);
  nya.addNyIdMarker(1,80);
  nya.addNyIdMarker(2,80);
  nya.addNyIdMarker(3,80);
  nya.addNyIdMarker(4,80);
  nya.addNyIdMarker(5,80);
  nya.addNyIdMarker(6,80);
  nya.addNyIdMarker(7,80);
  nya.addNyIdMarker(8,80);
  nya.addNyIdMarker(9,80);
  cam.start();
  frameRate(5); //Camera is only updating 5 times a second so we can go pretty slowly
}

int c=0;

void draw()
{
  c++;
  c++;
  c++;
  c++;
  if (cam.available() !=true) {
      return;
  }
  cam.read();
  nya.detect(cam);
  background(0);
  nya.drawBackground(cam);//frustumを考慮した背景描画
  lights();
  spotLight(126, 126, 126, 0, 0, -1,0,0,0,0,0);
  
  
  

  //right
  if((nya.isExist(0))){
    nya.beginTransform(0);
    //fill(0,0,255);
    translate(0,0,20);
    rotate((float)c/100);
    rotateX(HALF_PI);
    shape(one,0,0);
    nya.endTransform();
  }
  //left
  if((nya.isExist(1))){
    nya.beginTransform(1);
    //fill(0,255,0);
    translate(0,0,20);
    rotate((float)c/100);
    shape(two,0,0);
    nya.endTransform();
  }
  if((nya.isExist(2))){
    nya.beginTransform(2);
    //fill(0,0,255);
    translate(0,0,20);
    rotate((float)c/100);
    shape(three,0,0);
    nya.endTransform();
  }
  if((nya.isExist(3))){
    nya.beginTransform(3);
    //fill(0,0,255);
    translate(0,0,20);
    //rotate((float)c/100);
    shape(four,0,0);
    nya.endTransform();
  }
  if((nya.isExist(4))){
    nya.beginTransform(4);
    //fill(0,0,255);
    translate(0,0,20);
    //rotateX(HALF_PI);
    shape(five,0,0);
    nya.endTransform();
  }
  if((nya.isExist(5))){
    nya.beginTransform(5);
    //fill(0,0,255);
    translate(0,0,20);
    //rotate((float)c/100);
    shape(six,0,0);
    nya.endTransform();
  }
  if((nya.isExist(6))){
    nya.beginTransform(6);
    //fill(0,0,255);
    translate(0,0,20);
    rotateX(PI);
    rotate((float)c/100);
    shape(seven,0,0);
    nya.endTransform();
  }
  if((nya.isExist(7))){
    nya.beginTransform(7);
    //fill(0,0,255);
    translate(0,0,20);
    //rotateX(PI);
    rotate((float)c/100);
    shape(eight,0,0);
    nya.endTransform();
  }
  if((nya.isExist(8))){
    nya.beginTransform(8);
    //fill(0,0,255);
    translate(0,0,20);
    //rotateX(PI);
    rotate((float)c/100);
    shape(nine,0,0);
    nya.endTransform();
  }
  if((nya.isExist(9))){
    nya.beginTransform(9);
    //fill(0,0,255);
    translate(0,0,20);
    //rotateX(PI);
    rotate((float)c/100);
    shape(ten,0,0);
    nya.endTransform();
  }
  PImage img2 = get();
  background(0);
  pushMatrix();
  scale(-1,1);
  image(img2,-width,0);
  popMatrix();
  //scale(1,1);
  //fill(0);
  textSize(50);
  textAlign(CENTER, TOP);
  text("Pick up some nanotech with augmented reality", width/2, 100);
  textSize(40);
  text("www.cares.cam.ac.uk | #CambridgeCARESnanotech", width/2, height-100);
  
}

void keyPressed() {  
  saveFrame();
  delay(500);
  background(255,255,255);
  
}

 
