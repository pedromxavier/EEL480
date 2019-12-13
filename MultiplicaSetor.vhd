----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:20:16 10/18/2019 
-- Design Name: 
-- Module Name:    
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
use IEEE.NUMERIC_STD.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MultiplicaSetor is
    Port ( A : in  STD_LOGIC_VECTOR(15 DOWNTO 0);
			  B : in  STD_LOGIC_VECTOR( 3 DOWNTO 0);
			  C : out STD_LOGIC_VECTOR(19 DOWNTO 0)
			  ); 
end MultiplicaSetor;

architecture Behavioral of MultiplicaSetor is

	component MultiplicaBloco is
		 Port ( A : in  STD_LOGIC_VECTOR(3 DOWNTO 0);
				  B : in  STD_LOGIC_VECTOR(3 DOWNTO 0);
				  C : out STD_LOGIC_VECTOR(7 DOWNTO 0)
				  );
	end component;
	
	component SomaBloco is
		 Port ( A    : in  STD_LOGIC_VECTOR(3 DOWNTO 0);
				  B    : in  STD_LOGIC_VECTOR(3 DOWNTO 0);
				  cin  : in  STD_LOGIC_VECTOR(3 DOWNTO 0);
				  cout : out STD_LOGIC_VECTOR(3 DOWNTO 0);
				  C    : out STD_LOGIC_VECTOR(3 DOWNTO 0));
	end component;
	
		signal M0 : std_logic_vector(7 DOWNTO 0);
		signal M1 : std_logic_vector(7 DOWNTO 0);
		signal M2 : std_logic_vector(7 DOWNTO 0);
		signal M3 : std_logic_vector(7 DOWNTO 0);
		
		signal S0 : std_logic_vector(3 DOWNTO 0);
		signal S1 : std_logic_vector(3 DOWNTO 0);
		signal S2 : std_logic_vector(3 DOWNTO 0);
		signal S3 : std_logic_vector(3 DOWNTO 0);
		signal S4 : std_logic_vector(3 DOWNTO 0);
		-----------------------------------------
		signal C0 : std_logic_vector(3 DOWNTO 0);
		signal C1 : std_logic_vector(3 DOWNTO 0);
		signal C2 : std_logic_vector(3 DOWNTO 0);
		signal C3 : std_logic_vector(3 DOWNTO 0);
		signal C4 : std_logic_vector(3 DOWNTO 0);

	begin
	
		------------------------------------------------
		Mult0: MultiplicaBloco Port Map (
											A => A(3 DOWNTO 0),
											B => B,
											C => M0
											);
		Mult1: MultiplicaBloco Port Map (
											A => A(7 DOWNTO 4),
											B => B,
											C => M1
											);
		Mult2: MultiplicaBloco Port Map (
											A => A(11 DOWNTO 8),
											B => B,
											C => M2
											);
		Mult3: MultiplicaBloco Port Map (
											A => A(15 DOWNTO 12),
											B => B,
											C => M3
											);
		------------------------------------------------
		Soma0: SomaBloco Port Map (
											A => "0000",
											B => M0(3 DOWNTO 0),
											cin => "0000",
											cout => C0,
											C => S0
											);
											
		Soma1: SomaBloco Port Map (
											A => M0(7 DOWNTO 4),
											B => M1(3 DOWNTO 0),
											cin => C0,
											cout => C1,
											C => S1
											);
		
		Soma2: SomaBloco Port Map (
											A => M1(7 DOWNTO 4),
											B => M2(3 DOWNTO 0),
											cin => C1,
											cout => C2,
											C => S2
											);
		
		Soma3: SomaBloco Port Map (
											A => M2(7 DOWNTO 4),
											B => M3(3 DOWNTO 0),
											cin => C2,
											cout => C3,
											C => S3
											);
		Soma4: SomaBloco Port Map (
											A => M3(7 DOWNTO 4),
											B => "0000",
											cin => C3,
											cout => C4,
											C => S4
											);
		------------------------------------------------
		
		C(3 DOWNTO 0) <= S0;
		C(7 DOWNTO 4) <= S1;
		C(11 DOWNTO 8) <= S2;
		C(15 DOWNTO 12) <= S3;
		C(19 DOWNTO 16) <= S4;
	
end Behavioral;

