----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:20:16 10/18/2019 
-- Design Name: 
-- Module Name:    TamanhoConversorBCD - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SomaBloco is
    Port ( A : in  STD_LOGIC_VECTOR(3 DOWNTO 0); -- parcela 1
			  B : in  STD_LOGIC_VECTOR(3 DOWNTO 0); -- parcela 2
			  cin : in STD_LOGIC_VECTOR(3 DOWNTO 0); -- carry in
			  cout : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);-- carry out
           C : out  STD_LOGIC_VECTOR(3 DOWNTO 0)); -- soma
end SomaBloco;

architecture Behavioral of SomaBloco is

	signal C0 : std_logic_vector(4 DOWNTO 0);
	signal C1 : std_logic_vector(4 DOWNTO 0);
	
	signal A0 : std_logic_vector(4 DOWNTO 0);
	signal B0 : std_logic_vector(4 DOWNTO 0);

	signal CIN0 : std_logic_vector(4 DOWNTO 0);
	signal COUT0 : std_logic_vector(4 DOWNTO 0);

	begin
		A0 <= '0' & A;
		B0 <= '0' & B;
		CIN0 <= '0' & cin;
	
		C1 <= A0 + B0 + CIN0;
		
		process(C1)
			begin
				if C1 < 10 then
					C0 <= C1;
					COUT0 <= "00000";
				elsif C1 < 20 then
					C0 <= C1 - "01010"; -- 10
					COUT0 <= "00001";
				else
					C0 <= C1 - "10100"; -- 20
					COUT0 <= "00010";
				end if;
		end process;
		
		C <= C0(3 DOWNTO 0);
		cout <= COUT0(3 DOWNTO 0);
			
end Behavioral;

