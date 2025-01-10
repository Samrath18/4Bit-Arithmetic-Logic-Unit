----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:03:43 11/05/2024 
-- Design Name: 
-- Module Name:    B_Input - Behavioral 
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

entity B_Input is
    Port ( S : in  STD_LOGIC_VECTOR (1 downto 0);
           B : in  STD_LOGIC;
           Y : out  STD_LOGIC);
end B_Input;

architecture Behavioral of B_Input is

begin

Y <= '0' when (S(0) = '0' AND S(1) = '0') -- Output is '0' when both S(0) and S(1) are '0'
	else
		B when (S(0) = '1' AND S(1) = '0') -- Output=B when S(0)=1 and S(1)=0
   else
		NOT B when (S(0) = '0' AND S(1) = '1') -- Output!=B when S(0)=0 and S(1)=1
   else
		'1'; -- Output=1 for all other cases S(0)=1 and S(1)=1)

end Behavioral;

