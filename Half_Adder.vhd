----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:43:32 11/05/2024 
-- Design Name: 
-- Module Name:    Half_Adder - Behavioral 
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

entity Half_Adder is
    Port ( A_ha : in  STD_LOGIC;
           B_ha : in  STD_LOGIC;
           C_ha : out  STD_LOGIC;
           S_ha : out  STD_LOGIC);
end Half_Adder;

architecture Behavioral of Half_Adder is

begin

S_ha <= A_ha xor B_ha; -- Sum output of half adder
C_ha <= A_ha and B_ha; -- Carry output of half adder

end Behavioral;

