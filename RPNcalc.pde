/*
 * Jake Leland
 *
 * Reverse Polish Notation Calculator
 * 
 * This program is not true RPN; it's more like postfix math (very similar).
 * It takes a string and does all of the math at once.
 * A space differentiates between separate entries.
 * Press enter to calculate.
 *
 * Example:
 * Standard calculator: (8 * 2 + 15)/2 - 8
 * RPN calculator: 8 [enter] 2 * 15 + 2 / 8 -
 * This calculator: 8 2 * 15 + 2 / 8 -
 * Answer should come out to be 7.5
 * 
 * You can click the buttons on the calculator or use your keyboard.
 */


// Parameters: x value (of left edge), y value (of top edge), width, height, button text, x offset of text, y offset of text
Button plus = new Button(30,105,60,60,"+",-2,-2);
Button minus = new Button(105,105,60,60,"-",1,-2);
Button times = new Button(180,105,60,60,"*",2,4);
Button divide = new Button(255,105,60,60,"/",1,-3);
Button one = new Button(30,180,60,60,"1",0,0);
Button two = new Button(105,180,60,60,"2",0,0);
Button three = new Button(180,180,60,60,"3",0,0);
Button enter = new Button(255,180,60,135,"Enter",1,-3);
Button four = new Button(30,255,60,60,"4",0,0);
Button five = new Button(105,255,60,60,"5",0,0);
Button six = new Button(180,255,60,60,"6",0,0);
Button seven = new Button(30,330,60,60,"7",0,0);
Button eight = new Button(105,330,60,60,"8",0,0);
Button nine = new Button(180,330,60,60,"9",0,0);
Button clear = new Button(255,330,60,60,"Clr",-12,0);
Button pwr = new Button(30,405,60,60,"Pwr",-17,0);
Button zero = new Button(105,405,60,60,"0",0,0);
Button space = new Button(180,405,135,60,"Space",0,0);

ArrayList<Button> buttons = new ArrayList<Button>();


boolean reset = false;
boolean power = false;
String math = "";

PFont screenFont;
PFont buttonFont;

void setup()
{
  buttons.add(plus);
  buttons.add(minus);
  buttons.add(times);
  buttons.add(divide);
  buttons.add(one);
  buttons.add(two);
  buttons.add(three);
  //buttons.add(enter);
  buttons.add(four);
  buttons.add(five);
  buttons.add(six);
  buttons.add(seven);
  buttons.add(eight);
  buttons.add(nine);
  //buttons.add(clear);
  //buttons.add(pwr);
  buttons.add(zero);
  //buttons.add(space);
  
  smooth();
  screenFont = loadFont("Segmental-30.vlw");
  buttonFont = loadFont("LucidaSans-30.vlw");
  size(345,495);
}

void drawScreen(int x, int y)
{
  if(power)
    fill(245);
  else
    fill(50);
  rect(x,y,285,60);
}

void mouseReleased()
{
  if(reset)
  {
    math = "";
    println("\nClear");
    reset = false;
  }
  
  if(pwr.isOver())
  {
    if(power)
    {
      power=false;
      println("\nPower Off");
      exit();
    }
    else
    {
      power=true;
      println("\nPower On");
    }
  }
  else if(space.isOver() && power)
  {
    math += " ";
    print("_");
  }
  else if(clear.isOver() && power)
  {
    math = "";
    println("\nClear");
  }
  else if(enter.isOver() && power)
  {
    println("\nCalculating...");
    String ans = parse(math);
    math = ans;
    if(ans.equals("Error") || ans.equals("Err Divide by 0"))
      reset = true;
    print(ans);
  }
  else
  {
    for(Button b : buttons)
    {
      if(b.isOver() && power)
      {
        String val = b.getVal();
        math += val;
        print(val);
      }
    }
  }
}

void keyPressed()
{
  if(reset)
  {
    math = "";
    println("\nClear");
    reset = false;
  }
  
  if(key==(char)9)
  {
    if(power)
    {
      power=false;
      println("\nPower Off");
      exit();
    }
    else
    {
      power=true;
      println("\nPower On");
    }
  }
  else if(key==' ' && power)
  {
    math += " ";
    print("_");
  }
  else if((key==(char)8 || key==(char)127 || key=='.') && power)
  {
    math = "";
    println("\nClear");
  }
  else if(key==(char)10 && power)
  {
    println("\nCalculating...");
    String ans = parse(math);
    math = ans;
    if(ans.equals("Error") || ans.equals("Err Divide by 0"))
      reset = true;
    print(ans);
  }

  else
  {
    for(Button b : buttons)
    {
      String val = b.getVal();
      if(key==val.charAt(0) && power)
      {
        math += val;
        print(val);
      }
    }
  }
}

void draw()
{
  textFont(buttonFont);
  background(100);
  drawScreen(30,30);
  for(Button b : buttons)
    b.d();
  enter.d();
  clear.d();
  pwr.d();
  space.d();
  
  
  if(power)
  {
    textFont(screenFont);
    int changeAmt = 0;
    if(math.length() > 44)
    {
      changeAmt = round((math.length()/5.0)+9.5);
      println("** " + math.length() + " " + math.length()/3.0 + " " + ((math.length()/5.0)+9.5) + " " + changeAmt);
    }
    else if(math.length() > 39)
    {
      changeAmt = round((math.length()/3.0)+3.66666666666666666666666666666666666);
      println("* " + math.length() + " " + math.length()/3.0 + " " + ((math.length()/3.0)+3.66666666666666666666) + " " + changeAmt);
    }
    else if(math.length() > 26)
    {
      changeAmt = round((math.length()/2.0)-3);
      println(math.length() + " " + math.length()/2.0 + " " + ((math.length()/2.0)-3) + " " + changeAmt);
    }
    else if(math.length() > 16)
    {
      changeAmt = math.length()-16;
      println(changeAmt);
    }
    else
    {
      changeAmt = 0;
    }
    textSize(30 - changeAmt);
    text(math,51,72);
    textFont(buttonFont);
  }
}
