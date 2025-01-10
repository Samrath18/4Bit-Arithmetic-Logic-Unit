----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:34:07 11/05/2024 
-- Design Name: 
-- Module Name:    FourBit_ALU - Behavioral 
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

entity FourBit_ALU is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           S : in  STD_LOGIC_VECTOR (2 downto 0);
           Cin : in  STD_LOGIC;
           Cout : out  STD_LOGIC;
           G : out  STD_LOGIC_VECTOR (3 downto 0));
end FourBit_ALU;

architecture Behavioral of FourBit_ALU is

	component OneStage_ALU
		Port ( S : in  STD_LOGIC_VECTOR(2 downto 0);
				A : in  STD_LOGIC;
				B : in  STD_LOGIC;
				Cin : in  STD_LOGIC;
				Cout : out  STD_LOGIC;
				G : out  STD_LOGIC);
	end component;

	signal Cout_4bit : STD_LOGIC_VECTOR(2 downto 0); -- Declare a 3-bit vector signal to hold carry outputs between ALUs

	begin

	-- First ALU performs operation on A(0), B(0), and Cin, creating the first carry Cout_4bit(0) which goes to the ALU_2, and output G(0)
	ALU_1: OneStage_ALU port map (S, A(0), B(0), Cin, Cout_4bit(0), G(0));
	
	-- Second ALU performs operation on A(1), B(1), and carry from ALU_1, creating the next carry Cout_4bit(1) which goes to ALU_3, and output G(1)
	ALU_2: OneStage_ALU port map (S, A(1), B(1), Cout_4bit(0), Cout_4bit(1), G(1));
	
	-- Third ALU performs operation on A(2), B(2), and carry from ALU_2, creating the next carry Cout_4bit(2) which goes to ALU_4, and output G(2)
	ALU_3: OneStage_ALU port map (S, A(2), B(2), Cout_4bit(1), Cout_4bit(2), G(2));
	
	-- Fourth ALU performs operation on A(3), B(3), and the carry from ALU_3, creating the final carry Cout and output G(3)
	ALU_4: OneStage_ALU port map (S, A(3), B(3), Cout_4bit(2), Cout, G(3));

end Behavioral;