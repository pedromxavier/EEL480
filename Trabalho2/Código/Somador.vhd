----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:21:09 10/18/2019 
-- Design Name: 
-- Module Name:    Somador - Behavioral 
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


entity Somador is
    Port ( Atotal : in  STD_LOGIC_VECTOR(15 DOWNTO 0);
			  Btotal : in  STD_LOGIC_VECTOR(15 DOWNTO 0);
           Somatotal : out  STD_LOGIC_VECTOR(15 DOWNTO 0);
			  Carryouttotal : OUT STD_LOGIC);
end Somador;

architecture Behavioral of Somador is
	
	component SomaBloco is
		 Port ( A : in  STD_LOGIC_VECTOR(4 DOWNTO 0);
				  B : in  STD_LOGIC_VECTOR(4 DOWNTO 0);
				  carryin : in STD_LOGIC_VECTOR(4 DOWNTO 0);
				  carryout : OUT STD_LOGIC_VECTOR (4 DOWNTO 0);
				  soma : out  STD_LOGIC_VECTOR(4 DOWNTO 0));
	end component;--- sinais das portas de direcionamento das referentes
			 --- ao componente SomaBloco
			 
	signal carryout0: std_logic_vector(4 DOWNTO 0);
	signal carryout1: std_logic_vector(4 DOWNTO 0);
	signal carryout2: std_logic_vector(4 DOWNTO 0);
	signal carryout3: std_logic_vector(4 DOWNTO 0);
begin

	--Port maps dos blocos do somador
	Parcial0: SomaBloco Port Map (A => ('0' & Atotal(3 downto 0)),
											B => ('0' & Btotal(3 downto 0)),
											carryin => "00000",
											carryout => carryout0,
											soma => Somatotal(3 downto 0));
											
	Parcial1: SomaBloco Port Map (A => ('0' & Atotal(7 downto 4)),
											B => ('0' & Btotal(7 downto 4)),
											carryin => carryout0,
											carryout => carryout1,
											soma => Somatotal(7 downto 4));											
	
	Parcial2: SomaBloco Port Map (A => ('0' & Atotal(11 downto 8)),
											B => ('0' & Btotal(11 downto 8)),
											carryin => carryout1,
											carryout => carryout2,
											soma => Somatotal(11 downto 8));	
	
	Parcial3: SomaBloco Port Map (A => ('0' & Atotal(15 downto 12)),
											B => ('0' & Btotal(15 downto 12)),
											carryin => carryout2,
											carryout => carryout3,
											soma => Somatotal(15 downto 12));


											
	--terminar port map e fazer signals


end Behavioral;

