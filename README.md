RPNCalc
=======

A (sort-of) Reverse Polish Notation Calculator.

Note: This is a [Processing](http://processing.org/) sketch.

This program is not true RPN; it's more like postfix math (very similar). It takes in a string and does all of the math at once.
You can click the buttons on the calculator or use your keyboard to enter the math (a space differentiates between separate entries), then press enter to calculate.

Example (answer is 7.5):
- Standard calculator: (8 * 2 + 15)/2 - 8
- RPN calculator: 8 [enter] 2 * 15 + 2 / 8 -
- This calculator: 8 2 * 15 + 2 / 8 -

`RPNCalc.pde` is the main file, `Button.pde` contains the button class, and `Parse.pde` contains the code that reads in the string and does the math.

I did not do all of the code by myself; this project was in collaboration with Andrew Martz.
