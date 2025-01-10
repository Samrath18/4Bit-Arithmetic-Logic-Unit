----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:15:25 11/05/2024 
-- Design Name: 
-- Module Name:    LOGIC - Behavioral 
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

entity LOGIC is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           S : in  STD_LOGIC_VECTOR (1 downto 0);
           G : out  STD_LOGIC);
end LOGIC;

architecture Behavioral of LOGIC is

   component MUX_FourOne is
       Port ( A : in STD_LOGIC;
               B : in STD_LOGIC;
               C : in STD_LOGIC;
               D : in STD_LOGIC;
               S : in STD_LOGIC_VECTOR(1 downto 0);
               Z : out STD_LOGIC);
   end component;

   signal W: STD_LOGIC_VECTOR (3 downto 0); -- Declare a 4-bit signal W

begin

   W(0) <= A and B; -- W(0) stores the AND operation of A and B
   W(1) <= A or B; -- W(1) stores the OR operation of A and B
   W(2) <= A xor B; -- W(2) stores the XOR operation of A and B
	W(3) <= not A; -- W(3) stores the NOT operation of A

	-- 4-to-1 multiplexer with inputs W(0), W(1), W(2), or W(3) based on selector variable S and output to G
   logicMux41 : MUX_FourOne port map (W(0), W(1), W(2), W(3), S, G);

end Behavioral;

