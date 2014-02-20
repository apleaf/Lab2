----------------------------------------------------------------------------------
-- Company: USAFA
-- Engineer: Alex Leaf
-- 
-- Create Date:    16:42:53 02/17/2014 
-- Design Name:  Four bit Adder from full adders!
-- Module Name:    fourbitadder - Structural 
-- Project Name: Lab2
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fourbitadder is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);--added bit
           B : in  STD_LOGIC_VECTOR (3 downto 0);--secodn added bit
			  Cin : in STD_LOGIC;--carry in
			  Cout : out STD_LOGIC;--carry out to carry in to the next adder
			  addorsub : in STD_LOGIC;--determines whether adding or subtracting the bits
			  overflow : out STD_LOGIC; --handles overflow of the foru bit adder
           S : out  STD_LOGIC_VECTOR (3 downto 0));--sum of the added bits
			  
end fourbitadder;

architecture Structural of fourbitadder is

signal E, F, G, H: STD_LOGIC;--internal signals to handle the carrys from one full adder to the next

signal beforeconversion : STD_LOGIC_VECTOR (3 downto 0);
signal twocompb : STD_LOGIC_VECTOR(3 downto 0);--signal to represent the twos complement for subtraction


 

component fulladder is
		port (A : in STD_LOGIC;
				B : in STD_LOGIC;
				Cin : in STD_LOGIC;
				Cout : out STD_LOGIC;
				S : out STD_LOGIC);
				
end component fulladder;


begin

beforeconversion <= B;
twocompb <= beforeconversion when addorsub = '0' else
		STD_LOGIC_VECTOR (SIGNED(not beforeconversion)+1) when addorsub = '1';--creates twos complement of the bit when we are subtracting

Bit0: component fulladder
		port map (A => A(0),
					 B => twocompb(0),
					 Cin => '0',
					 Cout => E,
					 S =>   S(0));
					 
Bit1: component fulladder
		port map (A => A(1),
					 B => twocompb(1),
					 Cin => E,
					 Cout => F,
					 S =>   S(1));
					 
Bit2: component fulladder
		port map (A => A(2),
					 B => twocompb(2),
					 Cin => F,
					 Cout => G,
					 S =>   S(2));
					 
Bit3: component fulladder
		port map (A => A(3),
					 B => twocompb(3),
					 Cin => G,
					 Cout => H,
					 S =>   S(3));
					 
overflow <= G xor H; --overflow!!


end Structural;

