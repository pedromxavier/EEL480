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
	
	component SomaBloco is
		 Port ( A    : in  STD_LOGIC_VECTOR(3 DOWNTO 0);
				  B    : in  STD_LOGIC_VECTOR(3 DOWNTO 0);
				  cin  : in  STD_LOGIC_VECTOR(3 DOWNTO 0);
				  cout : out STD_LOGIC_VECTOR(3 DOWNTO 0);
				  C    : out STD_LOGIC_VECTOR(3 DOWNTO 0));
	end component;
	-------------------------------------------
	signal AB0 : STD_LOGIC_VECTOR(19 DOWNTO 0);
	signal AB1 : STD_LOGIC_VECTOR(19 DOWNTO 0);
	signal AB2 : STD_LOGIC_VECTOR(19 DOWNTO 0);
	signal AB3 : STD_LOGIC_VECTOR(19 DOWNTO 0);
	-------------------------------------------
	
	------------------------------------------
	signal S0 : STD_LOGIC_VECTOR(3 DOWNTO 0);
	signal S1 : STD_LOGIC_VECTOR(3 DOWNTO 0);
	signal S2 : STD_LOGIC_VECTOR(3 DOWNTO 0);
	signal S3 : STD_LOGIC_VECTOR(3 DOWNTO 0);
	signal S4 : STD_LOGIC_VECTOR(3 DOWNTO 0);
	signal S5 : STD_LOGIC_VECTOR(3 DOWNTO 0);
	signal S6 : STD_LOGIC_VECTOR(3 DOWNTO 0);
	signal S7 : STD_LOGIC_VECTOR(3 DOWNTO 0);
	signal S8 : STD_LOGIC_VECTOR(3 DOWNTO 0);
	signal S9 : STD_LOGIC_VECTOR(3 DOWNTO 0);
	signal SA : STD_LOGIC_VECTOR(3 DOWNTO 0);

	
	signal SC0 : STD_LOGIC_VECTOR(3 DOWNTO 0);
	signal SC1 : STD_LOGIC_VECTOR(3 DOWNTO 0);
	signal SC2 : STD_LOGIC_VECTOR(3 DOWNTO 0);
	signal SC3 : STD_LOGIC_VECTOR(3 DOWNTO 0);
	signal SC4 : STD_LOGIC_VECTOR(3 DOWNTO 0);
	signal SC5 : STD_LOGIC_VECTOR(3 DOWNTO 0);
	signal SC6 : STD_LOGIC_VECTOR(3 DOWNTO 0);
	signal SC7 : STD_LOGIC_VECTOR(3 DOWNTO 0);
	signal SC8 : STD_LOGIC_VECTOR(3 DOWNTO 0);
	signal SC9 : STD_LOGIC_VECTOR(3 DOWNTO 0);
	signal SCA : STD_LOGIC_VECTOR(3 DOWNTO 0);
	signal SCB : STD_LOGIC_VECTOR(3 DOWNTO 0);
	signal SCC : STD_LOGIC_VECTOR(3 DOWNTO 0);
	signal SCD : STD_LOGIC_VECTOR(3 DOWNTO 0);
	signal SCE : STD_LOGIC_VECTOR(3 DOWNTO 0);
	signal SCF : STD_LOGIC_VECTOR(3 DOWNTO 0);
	signal SCG : STD_LOGIC_VECTOR(3 DOWNTO 0);
	signal SCH : STD_LOGIC_VECTOR(3 DOWNTO 0);
	------------------------------------------
	
	-----------------------------------------
	signal C0 : STD_LOGIC_VECTOR(3 DOWNTO 0);
	signal C1 : STD_LOGIC_VECTOR(3 DOWNTO 0);
	signal C2 : STD_LOGIC_VECTOR(3 DOWNTO 0);
	signal C3 : STD_LOGIC_VECTOR(3 DOWNTO 0);
	signal C4 : STD_LOGIC_VECTOR(3 DOWNTO 0);
	signal C5 : STD_LOGIC_VECTOR(3 DOWNTO 0);
	signal C6 : STD_LOGIC_VECTOR(3 DOWNTO 0);
	signal C7 : STD_LOGIC_VECTOR(3 DOWNTO 0);
	-----------------------------------------
	
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
	
	------------------------------------------
	C0 <= AB0(3 downto 0); -- AB0[0]
	------------------------------------------
	SB00 : SomaBloco Port Map(
								A => AB0(7 downto 4), -- AB0[1]
								B => AB1(3 downto 0), -- AB1[0]
								cin => "0000",
								cout => SC0,
								C => C1
								);
	
	SB01 : SomaBloco Port Map(
								A => AB0(7 downto 4), -- AB0[2]
								B => AB1(3 downto 0), -- AB1[1]
								cin => "0000",
								cout => SC0,
								C => C1
								);
	------------------------------------------
	SB02 : SomaBloco Port Map(
								A => AB0(11 downto 8), -- AB0[2]
								B => AB1( 7 downto 4), -- AB1[1]
								cin => "0000",
								cout => SC1,
								C => S0
								);
	
	SB03 : SomaBloco Port Map(
								A => S0, 
								B => AB2(3 downto 0), -- AB2[0]
								cin => SC0,
								cout => SC2,
								C => C2
								);
	---------------------------------
	SB04 : SomaBloco Port Map(
								A => AB0(15 downto 12), -- AB0[3]
								B => AB1(11 downto  8), -- AB1[2]
								cin => SC1,
								cout => SC3,
								C => S1
								);
	
	SB05 : SomaBloco Port Map(
								A => AB2(7 downto 4), -- AB2[1] 
								B => AB3(3 downto 0), -- AB3[0]
								cin => SC2,
								cout => SC4,
								C => S2
								);
	
	SB06 : SomaBloco Port Map(
								A => S1, 
								B => S2,
								cin => "0000",
								cout => SC5,
								C => C3
								);
	---------------------------------
	SB07 : SomaBloco Port Map(
								A => AB0(19 downto 16), -- AB0[4] 
								B => AB1(15 downto 12), -- AB1[3]
								cin => SC3,
								cout => SC6,
								C => S3
								);
								
	SB08 : SomaBloco Port Map(
								A => AB2(19 downto 16), -- AB2[2] 
								B => AB3(15 downto 12), -- AB3[1]
								cin => SC4,
								cout => SC7,
								C => S4
								);
	
	SB09 : SomaBloco Port Map(
								A => S3,
								B => S4,
								cin => SC5,
								cout => SC8,
								C => C4
								);
	
	---------------------------------

	SB0A : SomaBloco Port Map(
								A => AB1(19 downto 16), -- AB1[4]
								B => AB2(15 downto 12), -- AB2[3]
								cin => SC6,
								cout => SC9,
								C => S5
								);
	
	SB0B : SomaBloco Port Map(
								A => AB3(11 downto 8), -- AB3[2]
								B => "0000",
								cin => SC7,
								cout => SCA,
								C => S6
								);
	
	SB0C : SomaBloco Port Map(
								A => S5,
								B => S6,
								cin => SC8,
								cout => SCB,
								C => C5
								);
	
	---------------------------------

	SB0D : SomaBloco Port Map(
								A => AB2(19 downto 16), -- AB2[4]
								B => AB3(15 downto 12), -- AB3[3]
								cin => "0000",
								cout => SCC,
								C => S7
								);
	
	SB0E : SomaBloco Port Map(
								A => SC9,
								B => SCA,
								cin => SCB,
								cout => SCD,
								C => S8
								);
	
	SB0F : SomaBloco Port Map(
								A => S7,
								B => S8,
								cin => "0000",
								cout => SCE,
								C => C6
								);
	
	---------------------------------
	
	SB0G : SomaBloco Port Map(
								A => AB3(19 downto 16), -- AB3[4]
								B => "0000",
								cin => SCE,
								cout => SCF,
								C => S9
								);
	
	SB0H : SomaBloco Port Map(
								A => SCC,
								B => SCD,
								cin => "0000",
								cout => SCG,
								C => SA
								);
	
	SB0I : SomaBloco Port Map(
								A => S9,
								B => SA,
								cin => "0000",
								cout => SCH,
								C => C7
								);
								
	C <= C7 & C6 & C5 & C4 & C3 & C2 & C1 & C0;
	
end Behavioral;

