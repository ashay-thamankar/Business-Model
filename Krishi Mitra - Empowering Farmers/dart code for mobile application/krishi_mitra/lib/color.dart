import 'package:flutter/material.dart';

bool control1 = true;
const activeCardColor = Color(0xffa6ff4d);
const inactiveCardColor = Color(0xffccff99);
Color c1 = inactiveCardColor;
Color c2 = inactiveCardColor;
Color c3 = inactiveCardColor;
Color c4 = inactiveCardColor;
Color c5 = inactiveCardColor;
Color c6 = inactiveCardColor;

void changeColor(int num){
  if(num==1){
    if(c1==inactiveCardColor){
      c1=activeCardColor;
      control1 = true;
    }
    else{
      c1=inactiveCardColor;
      control1 = false;
    }
  }
  if(num==2){
    if(c2==inactiveCardColor){
      c2=activeCardColor;
      control1 = true;
    }
    else{
      c2=inactiveCardColor;
      control1 = false;
    }
  }
  if(num==3){
    if(c3==inactiveCardColor){
      c3=activeCardColor;
      control1 = true;
    }
    else{
      c3=inactiveCardColor;
      control1 = false;
    }
  }
  if(num==4){
    if(c4==inactiveCardColor){
      c4=activeCardColor;
      control1 = true;
    }
    else{
      c4=inactiveCardColor;
      control1 = false;
    }
  }
  if(num==5){
    if(c5==inactiveCardColor){
      c5=activeCardColor;
      control1 = true;
    }
    else{
      c5=inactiveCardColor;
      control1 = false;
    }
  }
  if(num==6){
    if(c6==inactiveCardColor){
      c6=activeCardColor;
      control1 = true;
    }
    else{
      c6=inactiveCardColor;
      control1 = false;
    }
  }
}