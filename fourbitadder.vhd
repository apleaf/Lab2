----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:42:53 02/17/2014 
-- Design Name: 
-- Module Name:    fourbitadder - Structural 
-- Project Name: 
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
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
			  Cin : in STD_LOGIC;
			  Cout : out STD_LOGIC;
			  addorsub : in STD_LOGIC;
			  overflow : out STD_LOGIC; 
           S : out  STD_LOGIC_VECTOR (3 downto 0));
			  
end fourbitadder;

architecture Structural of fourbitadder is

signal E, F, G, H: STD_LOGIC;

signal beforeconversion : STD_LOGIC_VECTOR (3 downto 0);
signal twocompb : STD_LOGIC_VECTOR(3 downto 0);


 

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
		STD_LOGIC_VECTOR (SIGNED(not beforeconversion)+1) when addorsub = '1';

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
					 
overflow <= G xor H;


end Structural;

