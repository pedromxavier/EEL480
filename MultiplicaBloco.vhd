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
use IEEE.NUMERIC_STD.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MultiplicaBloco is
    Port ( A : in  STD_LOGIC_VECTOR(3 DOWNTO 0); -- parcela 1
			  B : in  STD_LOGIC_VECTOR(3 DOWNTO 0); -- parcela 2
			  C : out  STD_LOGIC_VECTOR(7 DOWNTO 0) -- mult
			  ); 
end MultiplicaBloco;

architecture Behavioral of MultiplicaBloco is

	signal res : unsigned (7 downto 0) := "00000000";
	signal q : unsigned (7 downto 0);
	signal r : unsigned (7 downto 0);
	
	signal cq : std_logic_vector (7 downto 0);
	signal cr : std_logic_vector (7 downto 0);
	
begin

	res <= unsigned(A) * unsigned(B);
	
	q <= res / 10;
	r <= res rem 10;
	
	cq <= STD_LOGIC_VECTOR(q);
	cr <= STD_LOGIC_VECTOR(r);
	
	C(7 DOWNTO 4) <= cq(3 DOWNTO 0);
	C(3 DOWNTO 0) <= cr(3 DOWNTO 0);
	
end Behavioral;

