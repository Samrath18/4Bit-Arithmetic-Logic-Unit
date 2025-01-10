----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:27:19 11/05/2024 
-- Design Name: 
-- Module Name:    OneStage_ALU - Behavioral 
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

entity OneStage_ALU is
    Port ( S : in  STD_LOGIC_VECTOR (2 downto 0);
           A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           Cout : out  STD_LOGIC;
           G : out  STD_LOGIC;
           Z : out  STD_LOGIC);
end OneStage_ALU;

architecture Behavioral of OneStage_ALU is

	component MUX_TwoOne is
		Port ( A : in  STD_LOGIC;
				B : in  STD_LOGIC;
				S : in  STD_LOGIC;
				Z : out  STD_LOGIC);
	end component;

	component LOGIC is
		Port ( A : in  STD_LOGIC;
				B : in  STD_LOGIC;
				S : in  STD_LOGIC_VECTOR(1 downto 0);
				G : out  STD_LOGIC);
	end component;

	component Arithmatic is
		Port ( C_in : in  STD_LOGIC;
				A : in  STD_LOGIC;
				B : in  STD_LOGIC;
				S : in  STD_LOGIC_VECTOR(1 downto 0);
				G : out  STD_LOGIC;
				C_out : out  STD_LOGIC);
	end component;

	signal N1, N2 : STD_LOGIC; -- Declare signals N1 and N2

begin

	-- Arithmetic operation with inputs Cin, A, B, and selector variables S0 and S1, output to signal N1 and Cout
	arith: Arithmatic port map(Cin, A, B, S(1 downto 0), N1, Cout);
	
	-- Logic operation with inputs A, B, and selector variables S0 and S1, output to N2
	log: LOGIC port map (A, B, S(1 downto 0), N2);
	
	-- 2-to-1 multiplexer selecting between signals N1 and N2 using S(2), output to G
	mux21: MUX_TwoOne port map(N1, N2, S(2), G);

end Behavioral;

