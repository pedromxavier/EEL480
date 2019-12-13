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
    Port ( A : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
			  B : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
           C : out  STD_LOGIC_VECTOR(31 DOWNTO 0);
			  cin : in STD_LOGIC_VECTOR(3 DOWNTO 0);
			  cout : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
			  );
end Somador;

architecture Behavioral of Somador is
	
	component SomaBloco is
		 Port ( A : in  STD_LOGIC_VECTOR(3 DOWNTO 0);
				  B : in  STD_LOGIC_VECTOR(3 DOWNTO 0);
				  cin : in STD_LOGIC_VECTOR(3 DOWNTO 0);
				  cout : out STD_LOGIC_VECTOR (3 DOWNTO 0);
				  C : out  STD_LOGIC_VECTOR(3 DOWNTO 0)
				  );
	end component;--- sinais das portas de direcionamento das referentes
			 --- ao componente SomaBloco
			 
	signal cout0: std_logic_vector(3 DOWNTO 0);
	signal cout1: std_logic_vector(3 DOWNTO 0);
	signal cout2: std_logic_vector(3 DOWNTO 0);
	signal cout3: std_logic_vector(3 DOWNTO 0);
	signal cout4: std_logic_vector(3 DOWNTO 0);
	signal cout5: std_logic_vector(3 DOWNTO 0);
	signal cout6: std_logic_vector(3 DOWNTO 0);
	
begin

	--Port maps dos blocos do somador
	Soma0: SomaBloco Port Map (A => A(3 downto 0),
											B => B(3 downto 0),
											cin => cin,
											cout => cout0,
											C => C(3 downto 0)
											);
											
	Soma1: SomaBloco Port Map (A => A(7 downto 4),
											B => B(7 downto 4),
											cin => cout0,
											cout => cout1,
											C => C(7 downto 4)
											);											
	
	Soma2: SomaBloco Port Map (A => A(11 downto 8),
											B => B(11 downto 8),
											cin => cout1,
											cout => cout2,
											C => C(11 downto 8)
											);	
	Soma3: SomaBloco Port Map (A => A(15 downto 12),
											B => B(15 downto 12),
											cin => cout2,
											cout => cout3,
											C => C(15 downto 12)
											);
	
	Soma4: SomaBloco Port Map (A => A(19 downto 16),
											B => B(19 downto 16),
											cin => cout3,
											cout => cout4,
											C => C(19 downto 16)
											);
	Soma5: SomaBloco Port Map (A => A(23 downto 20),
											B => B(23 downto 20),
											cin => cout4,
											cout => cout5,
											C => C(23 downto 20)
											);
	Soma6: SomaBloco Port Map (A => A(27 downto 24),
											B => B(27 downto 24),
											cin => cout5,
											cout => cout6,
											C => C(27 downto 24)
											);
	Soma7: SomaBloco Port Map (A => A(31 downto 28),
											B => B(31 downto 28),
											cin => cout6,
											cout => cout,
											C => C(31 downto 28)
											);
end Behavioral;

