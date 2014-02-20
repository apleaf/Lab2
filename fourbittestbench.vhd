--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:25:38 02/17/2014
-- Design Name:   
-- Module Name:   C:/Users/C16Alexander.Leaf/Desktop/ISE ECE281/Lab2/fourbittestbench.vhd
-- Project Name:  Lab2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: fourbitadder
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;
 
ENTITY fourbittestbench IS
END fourbittestbench;
 
ARCHITECTURE behavior OF fourbittestbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT fourbitadder
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         Cin : IN  std_logic;
         Cout : OUT  std_logic;
			addorsub : in STD_LOGIC;
			  overflow : out STD_LOGIC;
         S : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector (3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal Cin : std_logic := '0';
	signal addorsub : std_logic := '0'; 

 	--Outputs
   signal Cout : std_logic;
   signal S : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: fourbitadder PORT MAP (
          A => A,
          B => B,
          Cin => Cin,
          Cout => Cout,
			 addorsub => addorsub,
          S => S
        );

stim_proc: process
   
   begin
	
for i in 0 to 15 loop--for loop to go through all the added bits
	for j in 0 to 15 loop
	
	wait for 10 ns;
	
	B <= STD_LOGIC_VECTOR(to_signed(j, 4));
	end loop;
	
	A <= STD_LOGIC_VECTOR(to_signed(i, 4));
	
	assert S=A+B report "incorrect! A is " 
	
	& std_logic'image(A(3)) & std_logic'image(A(2)) & std_logic'image(A(1)) & std_logic'image(A(0)) & "B is " 
	& std_logic'image(B(3)) & std_logic'image(B(2)) & std_logic'image(B(1)) & std_logic'image(B(0));
	--outputs "incorrect" and where the problem was 'which bit'
	

	end loop;

wait for 10 ns ;

addorsub <= '1';--changed add or sub to '1' to now run through all the subtractions

for i in 0 to 15 loop
	for j in 0 to 15 loop
	
	wait for 10 ns;
	
	B <= STD_LOGIC_VECTOR(to_signed(j, 4));
	end loop;
	
	A <= STD_LOGIC_VECTOR(to_signed(i, 4));
	end loop;

	assert S=A-B report "incorrect! A is " 
	
	& std_logic'image(A(3)) & std_logic'image(A(2)) & std_logic'image(A(1)) & std_logic'image(A(0)) & "B is " 
	& std_logic'image(B(3)) & std_logic'image(B(2)) & std_logic'image(B(1)) & std_logic'image(B(0));
--outputs "incorrect" and where the problem was 'which bit'

end process;



END;
