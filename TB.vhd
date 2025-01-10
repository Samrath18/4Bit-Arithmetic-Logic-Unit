--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:46:22 11/05/2024
-- Design Name:   
-- Module Name:   /home/ise/ISE/G47_Lab7/TB.vhd
-- Project Name:  G47_Lab7
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FourBit_ALU
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB IS
END TB;
 
ARCHITECTURE behavior OF TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FourBit_ALU
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         S : IN  std_logic_vector(2 downto 0);
         Cin : IN  std_logic;
         Cout : OUT  std_logic;
         G : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal S : std_logic_vector(2 downto 0) := (others => '0');
   signal Cin : std_logic := '0';

 	--Outputs
   signal Cout : std_logic;
   signal G : std_logic_vector(3 downto 0); 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FourBit_ALU PORT MAP (
          A => A,
          B => B,
          S => S,
          Cin => Cin,
          Cout => Cout,
          G => G
        ); 

   -- Stimulus process
   stim_proc: process
   begin		
      -- insert stimulus here 
		
	--Addition0 15 + 13 = 12
	S<="001";
	A<="1111";
	B<="1101";
	Cin<='0';
	wait for 10 ns;
	assert (G= "1100" and Cout='1') report "test 1 failed" severity error;

	--Addition02 9 + 7 = 0
	S<="001";
	A<="1001";
	B<="0111";
	cin<='0';
	wait for 10 ns;
	assert (G= "0000" and Cout='1') report "test 2 failed" severity error;

	--Addition1
	S<="001";
	A<="1111";
	B<="1111";
	Cin<='1';
	wait for 10 ns;
	assert (G="1111" and Cout='1') report "test 3 failed" severity error;

	--Addition11
	S<="001";
	A<="0100";
	B<="0100";
	Cin<='1';
	wait for 10 ns;
	assert (G="1001" and Cout='0') report "test 4 failed" severity error;

	--subtract 3 - 9 = 10
	S<="010";
	A<="0011";
	B<="1001";
	Cin<='1';
	wait for 10 ns;
	assert (G = "1010" and Cout = '0') report "test 5 failed" severity error;

	--subtract2 9 - 4 = 5
	S<="010";
	A<="1001";
	B<="0100";
	Cin<='1';
	wait for 10 ns;
	assert (G = "1100" and Cout = '1') report "test 6 failed" severity error;

	--subtract3 13 - 15 = 14
	S<="010";
	A<="1101";
	B<="1111";
	Cin<='1';
	wait for 10 ns;
	assert (G = "1100" and Cout = '0') report "test 7 failed" severity error;

	--Transfer
	S<="000";
	A<="0101";
	B<="0000";
	cin<='0';
	wait for 10 ns;
	assert (G= "0101" and Cout='0') report "test 8 failed" severity error;
	
	--Transfer2
	S<="000";
	A<="1010";
	B<="1010";
	Cin<='0';
	wait for 10 ns;
	assert (G= "1010" and Cout='0') report "test 9 failed" severity error;

	--increment
	S<="000";
	A<="0010";
	B<="0000";
	Cin<='1';
	wait for 10 ns;
	assert (G= "0011" and Cout='0') report "test 10 failed" severity error;
	
	--increment2
	S<="000";
	A<="1111";
	B<="0101";
	Cin<='1';
	wait for 10 ns;
	assert (G= "0000" and Cout='1') report "test 11 failed" severity error;
		
	--complement
	S<="010";
	A<="0000";
	B<="0000";
	Cin<='0';
	wait for 10 ns;
	assert (G = "1111" and Cout = '0') report "test 12 failed" severity error;

	--complement2
	S<="010";
	A<="0010";
	B<="1101";
	Cin<='0';
	wait for 10 ns;
	assert (G = "0100" and Cout = '0') report "test 13 failed" severity error;

	--decrement
	S<="011";
	A<="0100";
	B<="0000";
	Cin<='0';
	wait for 10 ns;
	assert (G = "0011" and Cout = '1') report "test 14 failed" severity error;

	--decrement2
	S<="011";
	A<="1111";
	B<="0101";
	Cin<='0';
	wait for 10 ns;
	assert (G = "1110" and Cout = '1') report "test 15 failed" severity error;

	--transfer
	S<="011";
	A<="1111";
	B<="0101";
	Cin<='1';
	wait for 10 ns;
	assert (G = "1111" and Cout = '1') report "test 16 failed" severity error;

	--transfer2
	S<="011";
	A<="0011";
	B<="0000";
	Cin<='1';
	wait for 10 ns;
	assert (G = "0011" and Cout = '1') report "test 17 failed" severity error;

	--And
	S<="100";
	A<="0101";
	B<="0101";
	Cin<='1';
	wait for 10 ns;
	assert (G = "0101" and Cout = '0') report "test 18 failed" severity error;

	--And2
	S<="100";
	A<="1111";
	B<="0101";
	Cin<='0';
	wait for 10 ns;
	assert (G = "0101" and Cout = '0') report "test 19 failed" severity error;

	--Or
	S<="101";
	A<="0100";
	B<="0001";
	Cin<='0';
	wait for 10 ns;
	assert (G = "0101" and Cout = '0') report "test 20 failed" severity error;

	--Or2
	S<="101";
	A<="0110";
	B<="0100";
	Cin<='0';
	wait for 10 ns;
	assert (G = "0110" and Cout = '0') report "test 21 failed" severity error;

	--XOR
	S<="110";
	A<="0110";
	B<="0110";
	Cin<='0';
	wait for 10 ns;
	assert (G = "0000" and Cout = '0') report "test 22 failed" severity error;

	--XOR2
	S<="110";
	A<="0101";
	B<="1010";
	Cin<='0';
	wait for 10 ns;
	assert (G = "1111" and Cout = '0') report "test 23 failed" severity error;

	--NOT
	S<="111";
	A<="0101";
	B<="1010";
	Cin<='0';
	wait for 10 ns;
	assert (G = "1010" and Cout = '1') report "test 24 failed" severity error;

	--NOT2
	S<="111";
	A<="0110";
	B<="0000";
	Cin<='0';
	wait for 10 ns;
	assert (G = "1001" and Cout = '1') report "test 25 failed" severity error;

      wait;
   end process;

END;
