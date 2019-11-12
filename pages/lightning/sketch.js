'use strict';

var storm;
var startX;
var startY;
var endX;
var endY;
var startX2;
var startY2;
var endX2;
var endY2;
var startX3;
var startY3;
var endX3;
var endY3;
var xPos = 125;
var yPos = 200;
var yPos2 = 200;
var img1;
var img2;
var img3;
var timer = 0;
var mySound;

function preload() {
    soundFormats('wav', 'mp3');
    mySound = loadSound('data/storm.mp3');
    img1 = loadImage("data/toaster.png");
    img2 = loadImage("data/bathtub.png");
    img3 = loadImage("data/basketballPlayerNew.png");
}

function setup() {
    createCanvas(600, 400);
    strokeWeight(1.5);
    background(0);

    img1.resize(60, 45);
    img2.resize(175, 100);
    img3.resize(250, 175);
    mySound.setVolume(0.5);
    mySound.play();
}

function reset() {
    xPos = 125;
    yPos = 200;
    yPos2 = 200;
    timer = 0;
    //storm.stop();
}

function draw() {
    background(0);
    image(img3, 35, yPos2);
    image(img1, xPos, yPos);
    if (xPos < 150 && xPos >= 125) {
        frameRate(40);
        xPos += 1;
        yPos -= 2;
        yPos2 -= 1;
    }
    if (xPos < 175 && xPos >= 150) {
        frameRate(40);
        xPos += 1;
        yPos -= 2;
        yPos2 += 1;
    }
    if (xPos < 225 && xPos >= 175) {
        frameRate(50);
        xPos += 1;
        yPos -= 1;
    }
    if (xPos < 275 && xPos >= 225) {
        frameRate(60);
        xPos += 1;
    }
    if (xPos >= 275 && xPos < 325) {
        frameRate(50);
        xPos += 1;
        yPos += 1;
    }
    if (xPos >= 325 && xPos < 375) {
        frameRate(40);
        xPos += 1;
        yPos += 2;
    }
    if (xPos >= 375) {}
    image(img2, 310, 160);
    startX = 400;
    startY = 194;
    startX2 = 400;
    startY2 = 194;
    startX3 = 400;
    startY3 = 194;
    endX = 0;
    endY = 0;
    endX2 = 0;
    endY2 = 0;
    endX3 = 0;
    endY3 = 0;
    if (xPos >= 360) {
        timer++;
        frameRate(60);
        stroke(200, 200, 255);
        while (endX < width) {
            endX = startX + ((Math.random() * 20) - 9);
            endY = startY + ((Math.random() * 10) - 10);
            line(startX, startY, endX, endY);
            startX = endX;
            startY = endY;
        }
        stroke(175, 175, 255);
        while (endX2 < width) {
            endX2 = startX2 + ((Math.random() * 20) - 9);
            endY2 = startY2 + ((Math.random() * 10) - 10);
            line(startX2, startY2, endX2, endY2);
            startX2 = endX2;
            startY2 = endY2;
        }
        stroke(150, 150, 255);
        while (endX3 < width) {
            endX3 = startX3 + ((Math.random() * 20) - 9);
            endY3 = startY3 + ((Math.random() * 10) - 10);
            line(startX3, startY3, endX3, endY3);
            startX3 = endX3;
            startY3 = endY3;
        }
        textSize(72);
        text("SWISH!", 75, 150);
        fill(((Math.random() * 50) + 150), ((Math.random() * 50) + 150), 255);
        if (timer == 250) {
            reset();
        }
    }
}
