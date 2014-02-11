----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:59:03 02/10/2014 
-- Design Name: 
-- Module Name:    fulladder - Behavioral 
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

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fulladder is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           S : out  STD_LOGIC;
           Cout : out  STD_LOGIC);
end fulladder;

architecture Behavioral of fulladder is


signal A_NOT, B_NOT, Cin_NOT: STD_LOGIC;

begin

A_NOT<= not A;
B_NOT<= not B;
Cin_NOT <= not Cin;

S<= (A and B and Cin) or (A_NOT and B_NOT and Cin) or (A and B_NOT and Cin_NOT) or (A_NOT and B and Cin_NOT);
Cout<= (A_NOT and B and Cin) or (A and B_NOT and Cin) or (A and B);



end Behavioral;

