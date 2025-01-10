----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:08:20 11/05/2024 
-- Design Name: 
-- Module Name:    Arithmatic - Behavioral 
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

entity Arithmatic is
    Port ( C_in : in  STD_LOGIC;
           A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           S : in  STD_LOGIC_VECTOR (1 downto 0);
           G : out  STD_LOGIC;
           C_out : out  STD_LOGIC);
end Arithmatic;

architecture Behavioral of Arithmatic is

    component Full_Adder is
        Port ( A_fa : in STD_LOGIC;
               B_fa : in STD_LOGIC;
               Cin_fa : in STD_LOGIC;
               S_fa : out STD_LOGIC;
               Cout_fa : out STD_LOGIC);
    end component;
	 
	 component B_Input is
        Port ( B : in STD_LOGIC;
               S : in STD_LOGIC_VECTOR(1 downto 0);
               Y : out STD_LOGIC);
    end component;


    signal Y: STD_LOGIC;

begin

    B_in : B_Input port map (B, S, Y); -- Maps inputs B and S to calculate output Y in B_Input component
    Full_Add : Full_Adder port map (A, Y, C_in, G, C_out); -- Maps inputs A, Y, and C_in to generate sum G and carry C_out in Full_Adder component

end Behavioral;

