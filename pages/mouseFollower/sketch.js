'use strict';

var b = true;
var back = 0;
var sizeOfSquare = 50;

function setup() {
    createCanvas(500, 500);
}

function draw() {
    background(back);
    drawGrid();
    highlightSquare();
}

function drawGrid() {
    for (var x = 0; x < width; x += sizeOfSquare) {
        stroke(255, 0, 0);
        line(x, 0, x, height);
        line(0, x, width, x);
    }
}

function highlightSquare() {
    for (var x = 0; x < width; x += sizeOfSquare) {
        for (var y = 0; y < height; y += sizeOfSquare) {
            if (mouseX > x && mouseX < x + sizeOfSquare && mouseY > y && mouseY < y + sizeOfSquare) {
                fill(255, 255, 255);
                rect(x, y, sizeOfSquare, sizeOfSquare);
            }
        }
    }
}

function mouseClicked() {
    if (b == false) {
        back = 0;
        b = true;
    } else if (b == true) {
        back = 255;
        b = false;
    }
}
