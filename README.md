Lab2
====

ECE_281
=======

Alex Leaf

Schematic:
![alt text](http://i59.tinypic.com/zxl4jc.jpg)


4 Bit adder TestBench Output:
![alt text](http://i57.tinypic.com/w9y2d2.png)


#Design Process
The first step in the design process was to create a full adder that had a carry in and carry out.  To do this, I created a truth table and made two logic statements for the Sum and carry out.  I then made a behavioral model of this. After this, I made a four bit adder by using four of the Full Adders I created as components of the full adder. Here is where I initially ran into some trouble.  My carry ins and carry outs were not working properly, so after some trial and error I fixed the problem by creating more internal signals that would represent the carry out of one adder, and continue on and be the carry in for the next adder.  The synthesis of this circuit worked fine, so next I ran a test bench for the addition.  I went through and checked random spots to see if the four bits were adding correctly (they were).  Next, I added the subtraction funcionality.  To do this, I added a signal which would change between 0 and 1, 0 being addition and 1 being subtraction.  I then created another signal to represent the two's complement of the B bit so I could do subtraction.  When the button is pressed and the addorsub signal changes to '1', the second bit is converted into a two's complement.  Searching on the web showed me that to get my overflow signal to work, I needed an xor statement with the Carry in and carry out of the last full adder (G xor H).  After modifying my test bench more to verify that the subtraction and overflow worked, I moved on to the ucf file to actually implement the functionality to the nexys board.  I correlated the bits to switches, the outputs to LEDs on the board, the addorsub to a button, and the overflow is represented by an LED that is seperate from the rest of the LEDs that represent the sum.   
