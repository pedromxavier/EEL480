----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:42:33 12/13/2019 
-- Design Name: 
-- Module Name:    Calculadora - Behavioral 
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

entity Calculadora is
end Calculadora;

architecture Behavioral of Calculadora is	
	component lcd is
		Port ( 	
			NUMERO: in std_logic_vector(3 downto 0);
			BOTAO:  in std_logic;
			LED:    out std_logic;
			LCD_DB: out std_logic_vector(7 downto 0);		--DB( 7 through 0)
			RS:     out std_logic;  				--WE
			RW:     out std_logic;				--ADR(0)
			CLK:    in std_logic;				--GCLK2
			OE:     out std_logic;				--OE
			rst:    in std_logic		--BTN
			);
	end component;
begin


end Behavioral;

