----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/05/2026 03:37:14 PM
-- Design Name: 
-- Module Name: tb_blinking_led - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_blinking_led is
--  Port ( );
end tb_blinking_led;

architecture Behavioral of tb_blinking_led is
signal clk_tb : std_logic := '0';
signal rst_tb : std_logic := '1';
signal led_en_tb : std_logic := '0';
signal led_out_tb : std_logic;
constant clk_period : time := 8 ns;
constant CLK_CYCLES_PER_TOGGLE_tb : integer := 10;

begin

dut: entity work.blinking_led -- instantiate the design source and then assign signals
generic map (
CLK_CYCLES_PER_TOGGLE => CLK_CYCLES_PER_TOGGLE_tb
)
port map (
sys_clk => clk_tb,
rst => rst_tb,
led_en => led_en_tb,
led_out => led_out_tb
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
-- before tests begin, assert reset for 5 cycles, and then deassert reset, then assert led_en signal
rst_tb <= '1'; led_en_tb <= '0';
wait for 5 * clk_period;
rst_tb <= '0';
wait for 5 * clk_period;
led_en_tb <= '1';
wait;

end process;
end Behavioral;
