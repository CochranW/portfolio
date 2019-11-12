'use strict';

var br = new Array();
var br2 = new Array();
var br3 = new Array();
var bb = new Array();
var bb2 = new Array();
var bb3 = new Array();
var bb4 = new Array();
var s = "Hover over each box and watch the bacteria move!";
var s2 = "Note: Sequences do NOT reset themselves!";

function setup() {
    createCanvas(800, 485);
    br = new Bacteria();
    br2 = new Bacteria();
    br3 = new Bacteria();
    bb = new Bacteria();
    bb2 = new Bacteria();
    bb3 = new Bacteria();
    bb4 = new Bacteria();
    for (var i = 0; i < 300; i++) {
        br[i] = new Bacteria(width / 4 + width / 2, height / 2);
    }
    for (var i = 0; i < 300; i++) {
        bb[i] = new Bacteria(width / 4, height / 2);
    }
    for (var i = 0; i < 300; i++) {
        br2[i] = new Bacteria(width, height / 2);
    }
    for (var i = 0; i < 400; i++) {
        br3[i] = new Bacteria(width / 2, height / 2);
    }
    for (var i = 0; i < 500; i++) {
        bb2[i] = new Bacteria(width / 2, height / 2);
    }
    for (var i = 0; i < 500; i++) {
        bb3[i] = new Bacteria(width / 2 + width / 4, height / 2);
    }
    for (var i = 0; i < 500; i++) {
        bb4[i] = new Bacteria(width / 4, height / 2);
    }
}

function draw() {
    //move and show the bacteria   
    background(255);
    frameRate(60);
    fill(0, 255, 0);
    stroke(5);
    fill(100);
    textSize(32);
    text(s, 10, 30);
    text(s2, 60, 475);
    fill(255);
    rect(0, 40, 145, 100);
    fill(0);
    textSize(20);
    text("Expand from center of origin", 5, 45, 145, 100);
    fill(255);
    rect(0, 140, 145, 100);
    rect(0, 240, 145, 100);
    rect(0, 340, 145, 100);
    fill(0);
    textSize(20);
    text("Attack and defend sequence", 5, 145, 145, 100);
    noStroke();
    text("Multiply bacteria sequence", 5, 245, 145, 100);
    noStroke();
    text("Random bacteria bacteria", 5, 345, 145, 100);
    noStroke();
    if (mouseX < 145 && mouseY < 140 && mouseY > 40) {
        cursor(HAND);
        for (var i = 0; i < 300; i++) {
            br[i].move();
            br[i].showRed();
        }
        for (var i = 0; i < 300; i++) {
            bb[i].move();
            bb[i].showBlue();
        }
    }
    if (mouseX < 145 && mouseY < 240 && mouseY > 140) {
        cursor(HAND);
        bb[0].defend();
        for (var i = 0; i < 300; i++) {
            br2[i].attack();
            br2[i].showRed();
        }
    }
    if (mouseX < 145 && mouseY < 340 && mouseY > 240) {
        cursor(HAND);
        for (var i = 0; i < 500; i++) {
            bb2[i].showBlue();
            bb2[i].multiply();
            bb2[i].move();
        }
        for (var i = 0; i < 500; i++) {
            bb3[i].showBlue();
            bb3[i].multiply();
            bb3[i].move();
        }
        for (var i = 0; i < 500; i++) {
            bb4[i].showBlue();
            bb4[i].multiply();
            bb4[i].move();
        }
    }
    if (mouseX < 145 && mouseY < 440 && mouseY > 340) {
        cursor(HAND);
        for (var i = 0; i < 400; i++) {
            br3[i].showRed();
            br3[i].death();
            br3[i].move();
        }
    }
}
class Bacteria {

    constructor(x, y) {
        this.x = x;
        this.y = y;
        this.hit = false;

    }

    showRed() {
        noStroke();
        fill(255, 0, 0);
        ellipse(this.x, this.y, 5, 5);
    }

    showBlue() {
        noStroke();
        fill(0, 0, 255);
        ellipse(this.x, this.y, 5, 5);
    }

    move() {
        this.x += random(-5, 5);
        this.y += random(-5, 5);
    }

    defend() {
        var b = 0;
        for (var i = 0; i <= 118; i++) {
            b += 5;
            fill(0, 0, 255);
            ellipse(150, b, 5, 5);
        }
    }

    attack() {
        var die = Math.round((Math.random() * 80));
        if (this.x > 155 && this.hit == false) {
            this.x += Math.round((Math.random() * -9));
            this.y += Math.round((Math.random() * 32) - 16);
            fill(0, 0, 255);
            ellipse(this.x, this.y, 5, 5);
        }
        if (this.x > 150 && this.x < 160) {
            this.hit = true;
        }
        if (this.hit == true) {
            if (die == 0) {
                this.x = 5000;
                this.y = 5000;
            }
            if (die != 1) {
                this.x -= Math.round(Math.random() * -9);
                this.y += Math.round((Math.random() * 32) - 16);
                fill(0, 0, 255);
                ellipse(this.x, this.y, 5, 5);
            }
        }
    }

    multiply() {
        this.x += Math.round((Math.random() * 12) - 6);
        this.y += Math.round((Math.random() * 12) - 6);
        noStroke();
        fill(0, 0, 255);
        ellipse(this.x, this.y, 5, 5);
    }

    death() {
        var die = Math.round((Math.random() * 500));
        if (die == 0) {
            this.x = 5000;
            this.y = 5000;
        }
    }
}
