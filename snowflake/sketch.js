'use strict';

class Flake {

    var x = 0,
        y = 0,
        xSpeed = 0,
        ySpeed = 0,
        size = 0;

    constructor {
        this.x = (Math.random() * width);
        this.y = (Math.random() * 500) - 200;
        this.xSpeed = (Math.random() * 4) - 3;
        this.ySpeed = (Math.random() * 2) + 3;
        this.size = (Math.random() * 8) + 4;
    }

    function show() {
        fill(255);
        ellipse(x, y, size, size);

        fill(255, 255, 225);
    }

    function move() {
        x += xSpeed;
        y += ySpeed;
        if (y > 400) {
            y = (Math.random() * 100) - 100;
        }
    }
    void sendAway() {
        for (var i = 0; i <= 100; i++) {
            xSpeed += .01;
        }
    }
    void resetSnow() {
        xSpeed = (Math.random() * 4) - 3;
        x = (Math.random() * width);
        y = (Math.random() * 500) - 200;
    }
}

var r = 0,
    g = 0,
    b = 0;
Flake[] snow = new Flake[200];
var m = 800;
var light = true;
var box = false;
boolean keepGrowing = false;

function setup() {
    createCanvas(800, 400);
    for (var i = 0; i < snow.length; i++) {
        snow[i] = new Flake();
    }
}

function draw() {
    background(r, g, b);
    for (var i = 0; i < snow.length; i++) {
        snow[i].move();
        snow[i].show();
    }
    drawSnowman();
    drawMerry();
    growSnow();
    boxLocation();
    byeSnow();
    reset();

    if (light == true)
        drawMoon();
    else
        drawSun();
}

function boxLocation() {
    if (mouseX < 100 && mouseX > 0 && mouseY < 40 && mouseY > 0) {
        box = true;
    } else {
        box = false;
    }
}

function drawMerry() {
    textSize(30);
    fill(255, 0, 0);
    text("MERRY CHRISTMAS!", m, 365);
    if (m < -250) {
        m = 800;
    }
    m -= 1;
}

function byeSnow() {
    fill(255, 0, 0);
    rect(0, 0, 100, 20);
    fill(255);
    textSize(12);
    text("Send Snow Away", 0, 14);
    cursor(ARROW);
    if (mouseX < 100 && mouseY < 20) {
        cursor(HAND);
        if (mousePressed) {
            for (var i = 0; i < snow.length; i++) {
                snow[i].sendAway();
            }
        }
    }
}

function reset() {
    fill(255, 0, 0);
    rect(0, 20, 100, 20);
    fill(255);
    textSize(12);
    text("Reset Snow", 18, 34);
    cursor(ARROW);
    if (mouseX < 100 && mouseX > 0 && mouseY < 40) {
        cursor(HAND);
    }
    if (mouseX < 100 && mouseX > 0 && mouseY < 40 && mouseY > 20) {
        if (mousePressed) {
            for (var i = 0; i < snow.length; i++) {
                snow[i].resetSnow();
            }
        }
    }
}

function drawSnowman() {
    stroke(0);
    strokeWeight(0);
    fill(255);
    ellipse(200, 300, 125, 125);
    ellipse(200, 210, 100, 100);
    ellipse(200, 130, 75, 75);
    fill(0);
    ellipse(200, 210, 10, 10);
    ellipse(200, 230, 10, 10);
    ellipse(200, 190, 10, 10);
    ellipse(190, 125, 10, 10);
    ellipse(210, 125, 10, 10);
    fill(255, 155, 0);
    triangle(200, 135, 200, 145, 225, 140);
    stroke(100, 50, 0);
    strokeWeight(3);
    line(251, 210, 290, 180);
    line(149, 210, 119, 180);
}

function drawMoon() {
    stroke(0);
    strokeWeight(0);
    fill(204, 204, 204);
    ellipse(725, 75, 125, 125);
    fill(0);
    ellipse(755, 75, 95, 108);
}

function drawSun() {
    stroke(0);
    strokeWeight(0);
    fill(255, 200, 0);
    ellipse(725, 75, 100, 100);
}

function mousePressed() {
    if (box == false) {
        if (light == true) {
            r = 50;
            g = 150;
            b = 255;
            light = false;
        } else if (light == false) {
            r = 0;
            g = 0;
            b = 0;
            light = true;
        }
    }
    if (box == true && light == true) {
        light = true;
    } else if (box == true && light == false) {
        light = false;
    }
}

function growSnow() {
    var y = 400;
    var h = 0;
    for (var i = 0; i <= 1000; i++) {
        y -= .05;
        h += .05;
    }
    noStroke();
    fill(255);
    rect(0, y, 800, h);
}
