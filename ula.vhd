----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:00:26 12/12/2019 
-- Design Name: 
-- Module Name:    ula - Behavioral 
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

entity Ula is
	Port ( A : in  STD_LOGIC_VECTOR(15 DOWNTO 0);
			 B : in  STD_LOGIC_VECTOR(15 DOWNTO 0);
			 OP : in STD_LOGIC;
          C : out  STD_LOGIC_VECTOR(31 DOWNTO 0)
			 );
end Ula;

architecture Behavioral of Ula is

	component Somador is
		 Port ( A    : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
				  B    : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
				  C    : out STD_LOGIC_VECTOR(31 DOWNTO 0);
				  cin : in STD_LOGIC_VECTOR(3 DOWNTO 0);
				  cout : out STD_LOGIC_VECTOR(3 DOWNTO 0)
				  );
	end component;
	
	component Multiplicador is
		 Port ( A    : in  STD_LOGIC_VECTOR(15 DOWNTO 0);
				  B    : in  STD_LOGIC_VECTOR(15 DOWNTO 0);
				  C    : out STD_LOGIC_VECTOR(31 DOWNTO 0)
				  );
	end component;
	
	signal C_soma : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal C_mult : STD_LOGIC_VECTOR(31 DOWNTO 0);
	
	signal cout0 : STD_LOGIC_VECTOR(3 DOWNTO 0);
	
	signal SA : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal SB : STD_LOGIC_VECTOR(31 DOWNTO 0);
	
begin

	SA <= "0000000000000000" & A;
	SB <= "0000000000000000" & B;

	Soma: Somador Port Map (
									A => SA,
									B => SB,
									cin => "0000",
									cout => cout0,
									C => C_soma
									);
									
	Mult: Multiplicador Port Map (
											A => A,
											B => B,
											C => C_mult
											);
	
	process (C_soma, C_mult, OP) begin
	
		if OP = '1' then
			C <= C_mult;
		else
			C <= C_soma;
		end if;
	
	end process;

end Behavioral;

