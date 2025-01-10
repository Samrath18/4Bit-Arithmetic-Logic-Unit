----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:31:23 11/05/2024 
-- Design Name: 
-- Module Name:    Full_Adder - Behavioral 
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

entity Full_Adder is
    Port ( A_fa : in  STD_LOGIC;
           B_fa : in  STD_LOGIC;
           Cin_fa : in  STD_LOGIC;
           S_fa : out  STD_LOGIC;
           Cout_fa : out  STD_LOGIC);
end Full_Adder;

architecture Behavioral of Full_Adder is

	component Half_Adder
		port(A_ha : in STD_LOGIC;
		     B_ha : in STD_LOGIC;
			  S_ha : out STD_LOGIC;
			  c_ha : out STD_LOGIC);
	end component;
	
	signal hs, hc, tc: std_logic;

begin

		-- Two half adders used to make one full adder
		HA1: Half_Adder port map(A_ha=>A_fa, B_ha=>B_fa, S_ha=>hs, C_ha=> hc); -- First half adder
		HA2: Half_Adder port map(A_ha=>hs, B_ha=>Cin_fa, S_ha=>S_fa, C_ha=>tc); -- Second half adder
		
		Cout_fa <= (tc or hc); -- Final carry output for full adder
		
end Behavioral;

