----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:09:01 11/01/2019 
-- Design Name: 
-- Module Name:    Multiplicador - Behavioral 
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

entity Multiplicador is
	Port (   
			A : in  STD_LOGIC_VECTOR(15 DOWNTO 0);
			B : in  STD_LOGIC_VECTOR(15 DOWNTO 0);
			C : out  STD_LOGIC_VECTOR(31 DOWNTO 0)
			);
end Multiplicador;

architecture Behavioral of Multiplicador is
	
	component MultiplicaSetor is
		 Port ( A : in  STD_LOGIC_VECTOR(15 DOWNTO 0);
				  B : in  STD_LOGIC_VECTOR( 3 DOWNTO 0);
				  C : out STD_LOGIC_VECTOR(19 DOWNTO 0)
				  );
	end component;
	
	component Somador is
		 Port( A : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
				 B : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
				 C : out STD_LOGIC_VECTOR(31 DOWNTO 0);
				 cin : in STD_LOGIC_VECTOR(3 DOWNTO 0);
				 cout : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
			    );
	end component;
	-------------------------------------------
	signal AB0 : STD_LOGIC_VECTOR(19 DOWNTO 0);
	signal AB1 : STD_LOGIC_VECTOR(19 DOWNTO 0);
	signal AB2 : STD_LOGIC_VECTOR(19 DOWNTO 0);
	signal AB3 : STD_LOGIC_VECTOR(19 DOWNTO 0);
	
	signal SAB0 : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal SAB1 : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal SAB2 : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal SAB3 : STD_LOGIC_VECTOR(31 DOWNTO 0);
	-------------------------------------------	
	signal CS1 : STD_LOGIC_VECTOR(31 DOWNTO 0); -- signal
	signal CS2 : STD_LOGIC_VECTOR(31 DOWNTO 0);
	
	signal CC1 : STD_LOGIC_VECTOR(3 DOWNTO 0); -- carry
	signal CC2 : STD_LOGIC_VECTOR(3 DOWNTO 0);
	signal CC3 : STD_LOGIC_VECTOR(3 DOWNTO 0);
	-------------------------------------------
	
begin
	----------------------------------------------
	MS0 : MultiplicaSetor Port Map (
										A => A,
										B => B(3 downto 0),
										C => AB0
										);
	MS1 : MultiplicaSetor Port Map (
										A => A,
										B => B(7 downto 4),
										C => AB1
										);
	MS2 : MultiplicaSetor Port Map (
										A => A,
										B => B(11 downto 8),
										C => AB2
										);
	MS3 : MultiplicaSetor Port Map (
										A => A,
										B => B(15 downto 12),
										C => AB3
										);
	----------------------------------------------
	
	SAB0 <= "000000000000" & AB0;
	SAB1 <= "00000000" & AB1 & "0000";
	SAB2 <= "0000" & AB2 & "00000000";
	SAB3 <= AB3 & "000000000000";
	
	SM0 : Somador Port Map (
								A => SAB0,
								B => SAB1,
								C => CS1,
								cin => "0000",
								cout => CC1
								);
	
	SM1 : Somador Port Map (
								A => SAB2,
								B => SAB3,
								C => CS2,
								cin => "0000",
								cout => CC2
								);
								
	SM3 : Somador Port Map (
								A => CS1,
								B => CS2,
								C => C,
								cin => "0000",
								cout => CC3
								);
end Behavioral;

