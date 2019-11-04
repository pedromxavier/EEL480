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
    Port ( A : in  STD_LOGIC_VECTOR(4 DOWNTO 0); -- parcela 1
			  B : in  STD_LOGIC_VECTOR(4 DOWNTO 0); -- parcela 2
			  carryin : in STD_LOGIC_VECTOR(4 DOWNTO 0); -- carry in
			  carryout : OUT STD_LOGIC_VECTOR (4 DOWNTO 0);-- carry out
           soma : out  STD_LOGIC_VECTOR(4 DOWNTO 0)); -- soma
end SomaBloco;

architecture Behavioral of SomaBloco is

	signal somaParcial: std_logic_vector(4 DOWNTO 0);
	signal Alinha: std_logic_vector(4 DOWNTO 0);
	signal Blinha: std_logic_vector(4 DOWNTO 0);
	signal Carrylinha: std_logic_vector(4 DOWNTO 0);
	
	begin
		
		 Alinha<= A;
		 Blinha<= B;
       Carrylinha <= carryin;
		 
		somaParcial <= Alinha + Blinha + Carrylinha;
		
		process(somaParcial)
			begin
				if somaParcial > 9 then
					soma <= somaParcial - "1010";
					carryout <= "00001";
				else
					soma <= somaParcial;
					carryout <= "00000";
				end if;
		end process;
			
end Behavioral;

