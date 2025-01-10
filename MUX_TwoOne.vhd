----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:44:28 11/05/2024 
-- Design Name: 
-- Module Name:    MUX_TwoOne - Behavioral 
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

entity MUX_TwoOne is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           S : in  STD_LOGIC;
           Z : out  STD_LOGIC);
end MUX_TwoOne;

architecture Behavioral of MUX_TwoOne is

begin

    process (A, B, S) is
    begin
        -- If S=0 then Z=A
		  if (S = '0') then
            Z <= A;
			
		-- If S=0 then Z=A
        else
            Z <= B;
        end if;
    end process;

end Behavioral;

