----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:55:30 11/05/2024 
-- Design Name: 
-- Module Name:    dec_4_to_7 - dataflow2 
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

entity dec_4_to_7 is
    Port ( input_bits : in  STD_LOGIC_VECTOR (3 downto 0);
           display_output : out  STD_LOGIC_VECTOR (6 downto 0));
end dec_4_to_7;

architecture dataflow2 of dec_4_to_7 is

begin
	
	-- Mapping input 'input_bits' to the corresponding 7-segment display output 'display_output' using a 'when-else' conditional expression
	display_output <= "0000001" when input_bits <= "0000" else
							"1001111" when input_bits <= "0001" else
							"0010010" when input_bits <= "0010" else
							"0000110" when input_bits <= "0011" else
							"1001100" when input_bits <= "0100" else
							"0100100" when input_bits <= "0101" else
							"0100000" when input_bits <= "0110" else
							"0001111" when input_bits <= "0111" else
							"0000000" when input_bits <= "1000" else
							"0001100" when input_bits <= "1001" else
							"0001000" when input_bits <= "1010" else
							"1100000" when input_bits <= "1011" else
							"0110001" when input_bits <= "1100" else
							"1000010" when input_bits <= "1101" else
							"0110000" when input_bits <= "1110" else
							"0111000" when input_bits <= "1111" else
							"XXXXXXX"; -- Default case for invalid input

end architecture dataflow2;

