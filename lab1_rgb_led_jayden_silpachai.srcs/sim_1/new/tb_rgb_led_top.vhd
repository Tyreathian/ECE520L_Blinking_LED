----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/13/2026 03:16:42 PM
-- Design Name: 
-- Module Name: tb_rgb_led_top - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_rgb_led_top is
--  Port ( );
end tb_rgb_led_top;

architecture Behavioral of tb_rgb_led_top is
signal clk_tb : std_logic := '0';
signal rst_tb : std_logic := '1';
constant clk_period : time := 8 ns;
signal rgb_out_tb : std_logic_vector(2 downto 0);
signal sw_tb : std_logic_vector(2 downto 0);

begin

dut: entity work.rgb_led_top -- instantiate the design source and then assign signals
generic map (
CLK_CYCLES_PER_TOGGLE => 10
)
port map (
sys_clk => clk_tb,
rst => rst_tb,
rgb_out => rgb_out_tb,
sw => sw_tb
);

clk_process: process
begin
clk_tb <= '0';
wait for clk_period/2;
clk_tb <= '1';
wait for clk_period/2;
end process;

stimulus: 
process begin
-- Test Case 1 : Reset is high, no leds should blink
rst_tb <= '1'; sw_tb <= "000";
wait for 5 * clk_period;
rst_tb <= '0';
wait for 5 * clk_period;
-- Test Case 2 : Blink the red led
sw_tb <= "001";
wait for 35 * clk_period;
-- Test Case 3 : blink the green led
sw_tb <= "010";
wait for 35 * clk_period;
-- Test Case 4 : blink the blue led
sw_tb <= "100";
wait for 35 * clk_period;
-- Test Case 5 : Attempt to blink an invalid switch combo
sw_tb <= "111";
wait for 35 * clk_period;

sw_tb <= "000";
wait for 35 * clk_period;

wait;

end process;
end Behavioral;
