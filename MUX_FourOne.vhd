----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:57:39 11/05/2024 
-- Design Name: 
-- Module Name:    MUX_FourOne - Behavioral 
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

entity MUX_FourOne is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : in  STD_LOGIC;
           D : in  STD_LOGIC;
           S : in  STD_LOGIC_VECTOR (1 downto 0);
           Z : out  STD_LOGIC);
end MUX_FourOne;

architecture Behavioral of MUX_FourOne is

begin

	process (A, B, C, D, S) is
	
		begin
			-- Selects A when S = "00"
			if (S(0) = '0' and S(1) = '0') then
				Z <= A;
				
			-- Selects B when S = "10"
			elsif (S(0) = '1' and S(1) = '0') then
				Z <= B;
				
			-- Selects C when S = "01"
			elsif (S(0) = '0' and S(1) = '1') then
				Z <= C;
			
			-- Selects D when S = "11"
			else
				Z <= D;
			end if;
			
	end process;

end Behavioral;

