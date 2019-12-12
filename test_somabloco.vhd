--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:58:00 11/29/2019
-- Design Name:   
-- Module Name:   /home/sd/Desktop/FPGA2/test_somabloco.vhd
-- Project Name:  FPGA
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SomaBloco
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_somabloco IS
END test_somabloco;
 
ARCHITECTURE behavior OF test_somabloco IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SomaBloco
    PORT(
         A : IN  std_logic_vector(4 downto 0);
         B : IN  std_logic_vector(4 downto 0);
         carryin : IN  std_logic_vector(4 downto 0);
         carryout : OUT  std_logic_vector(4 downto 0);
         soma : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(4 downto 0) := (others => '0');
   signal B : std_logic_vector(4 downto 0) := (others => '0');
   signal carryin : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal carryout : std_logic_vector(4 downto 0);
   signal soma : std_logic_vector(4 downto 0);
   -- No clocks detected in port list. Replace clock below with 
   -- appropriate port name 
 
   constant clock_period : time := 10 ns;
	
	signal clock : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SomaBloco PORT MAP (
          A => A,
          B => B,
          carryin => carryin,
          carryout => carryout,
          soma => soma
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clock_period*10;

      -- insert stimulus here
		
		A <= "01000";
		B <= "01000";

      wait;
   end process;

END;
