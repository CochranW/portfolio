'use strict';

var total = 0;
//js

var rTotal = 0;
var xPos = 25;
var totalPos = 0;
var yPos = 600;
var x = 0;
var y = 0;
var interval;

function setup() {
    createCanvas(420, 820);
    interval = setInterval(timeIt, 500);
    noLoop();
}

function draw() {
    background(200);
    textSize(32);
    fill(255, 50, 50);
    text("Running Total = " + rTotal + "", 38, 35);
    textSize(21);
    text("Each Time you click your mouse the 9 \ndice will roll. The sum of the 9 dice \ndetermines how far the red dot below \nwill move. Land the dot COMPLETELY \nwithin the black area to win!", 25, 425);
    var die1 = new Die(50, 50);
    die1.show();
    var die2 = new Die(160, 50);
    die2.show();
    var die3 = new Die(270, 50);
    die3.show();
    var die4 = new Die(50, 160);
    die4.show();
    var die5 = new Die(160, 160);
    die5.show();
    var die6 = new Die(270, 160);
    die6.show();
    var die7 = new Die(50, 270);
    die7.show();
    var die8 = new Die(160, 270);
    die8.show();
    var die9 = new Die(270, 270);
    die9.show();
    die9.shapee();

}

function timeIt() {
    redraw();
}

function mousePressed() {
    redraw();
}
class Die {

    constructor(x, y) {
        this.x = x;
        this.y = y;
    }

    show() {
        strokeWeight(2);
        fill(255);
        rect(this.x, this.y, 100, 100, 10);
        var rand = Math.floor((Math.random() * 6 + 1));


        fill(0);
        if (rand == 1) {
            ellipse(this.x + 50, this.y + 50, 10, 10);
            total++;
            rTotal++;
        }
        if (rand == 2) {
            ellipse(this.x + 20, this.y + 20, 10, 10);
            ellipse(this.x + 80, this.y + 80, 10, 10);
            total += 2;
            rTotal += 2;
        }
        if (rand == 3) {
            ellipse(this.x + 20, this.y + 20, 10, 10);
            ellipse(this.x + 50, this.y + 50, 10, 10);
            ellipse(this.x + 80, this.y + 80, 10, 10);
            total += 3;
            rTotal += 3;
        }
        if (rand == 4) {
            ellipse(this.x + 25, this.y + 25, 10, 10);
            ellipse(this.x + 75, this.y + 25, 10, 10);
            ellipse(this.x + 25, this.y + 75, 10, 10);
            ellipse(this.x + 75, this.y + 75, 10, 10);
            total += 4;
            rTotal += 4;
        }
        if (rand == 5) {
            ellipse(this.x + 20, this.y + 20, 10, 10);
            ellipse(this.x + 80, this.y + 20, 10, 10);
            ellipse(this.x + 20, this.y + 80, 10, 10);
            ellipse(this.x + 80, this.y + 80, 10, 10);
            ellipse(this.x + 50, this.y + 50, 10, 10);
            total += 5;
            rTotal += 5;
        }
        if (rand == 6) {
            ellipse(this.x + 25, this.y + 25, 10, 10);
            ellipse(this.x + 25, this.y + 50, 10, 10);
            ellipse(this.x + 25, this.y + 75, 10, 10);
            ellipse(this.x + 75, this.y + 25, 10, 10);
            ellipse(this.x + 75, this.y + 50, 10, 10);
            ellipse(this.x + 75, this.y + 75, 10, 10);
            total += 6;
            rTotal += 6;
        }

        strokeWeight(1);
        line(25, 600, 25, 630);
        line(395, 600, 395, 630);
        rect(375, 620, 20, 10);
        line(25, 600, 395, 600);
        line(25, 610, 395, 610);
        line(25, 620, 395, 620);
        line(25, 630, 395, 630);
    }
    timeTotal() {
        var returnedTotal = total;
        total = 0;
        textSize(32);
        fill(255, 50, 50);
        text("Roll Total = " + returnedTotal + "", 100, 685);
        console.log(returnedTotal);
        return returnedTotal;
    }

    shapee() {
        xPos += this.timeTotal();
        console.log("xPos " + xPos)
        if (xPos > 375 && yPos < 620) {
            yPos += 10;
            var leftOver = xPos - 375;
            xPos = 25 + leftOver;
        }
        if (xPos > 375 && yPos == 620) {
            textSize(75);
            fill(255, 50, 50);
            text("You Lose!", 35, 800);
            xPos = 25;
            yPos = 600;
        }
        if (xPos >= 375 && xPos <= 385 && yPos == 620) {
            textSize(75);
            fill(255, 50, 50);
            text("Winner!", 70, 800);
        }
        fill(255, 50, 50);
        rect(xPos, yPos, 10, 10);
    }
}
