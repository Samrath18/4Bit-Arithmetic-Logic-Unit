----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:39:16 11/05/2024 
-- Design Name: 
-- Module Name:    TopLevel - Behavioral 
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

entity TopLevel is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           S : in  STD_LOGIC_VECTOR (2 downto 0);
           Cin : in  STD_LOGIC;
           Cout : out  STD_LOGIC;
           Seg : out  STD_LOGIC_VECTOR (6 downto 0));
end TopLevel;

architecture Behavioral of TopLevel is

	component FourBit_ALU is
		Port ( A : in  STD_LOGIC_VECTOR(3 downto 0);
				B : in  STD_LOGIC_VECTOR(3 downto 0);
				S : in  STD_LOGIC_VECTOR(2 downto 0);
				Cin : in  STD_LOGIC;
				Cout : out  STD_LOGIC;
				G : out  STD_LOGIC_VECTOR(3 downto 0));
	end component;

	component dec_4_to_7 is
		Port ( input_bits : in  STD_LOGIC_VECTOR(3 downto 0);
				display_output : out  STD_LOGIC_VECTOR(6 downto 0));
	end component;

	signal G : STD_LOGIC_VECTOR(3 downto 0); -- Declare a 4-bit signal G to store the result of the ALU operation
   signal display_output : STD_LOGIC_VECTOR(6 downto 0); -- Declare the signal for 7-segment display output

	begin

	-- Instantiate and pass signals A, B, S, and Cin as inputs to the FourBit_ALU component.
	-- The output is connected to the signal G (result of ALU operation), Cout (carry-out), and G (output of ALU operation).
	FourBit: FourBit_ALU port map (A, B, S, Cin, Cout, G);
	
   -- Instantiate the dec_4_to_7 component to convert the 4-bit result from G to a 7-segment display pattern.
   -- Signal G (output from ALU) is used as input to the 7-segment decoder.
   -- Display output is connected to the output of the 7-segment decoder.	
	DEC: dec_4_to_7 port map (G, display_output);
	Seg <= display_output;

end Behavioral;

