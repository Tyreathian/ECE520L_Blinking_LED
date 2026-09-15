----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/09/2026 02:03:42 PM
-- Design Name: 
-- Module Name: rgb_led_top - Behavioral
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

entity rgb_led_top is
generic (
CLK_CYCLES_PER_TOGGLE : integer := 62500500
);
Port (
sys_clk : in std_logic;
rst : in std_logic;
sw : in std_logic_vector(2 downto 0) := "000";
rgb_out : out std_logic_vector(2 downto 0)
);
end rgb_led_top;

architecture Behavioral of rgb_led_top is

component blinking_led is 
generic (
CLK_CYCLES_PER_TOGGLE : integer := 62500000
);
port ( 
sys_clk : in std_logic;
rst : in std_logic; 
led_en : in std_logic;
led_out : out std_logic
);
end component;

signal blink : std_logic;
signal led_enable : std_logic;

begin

process(sw)

begin
-- only 1 switch active allowed
if sw = "001" or sw = "010" or sw = "100" then
led_enable <= '1';
-- more than 1 switch is on, so no LED
else led_enable <= '0';
end if;
end process;

blink_instant : entity work.blinking_led
generic map (
CLK_CYCLES_PER_TOGGLE => CLK_CYCLES_PER_TOGGLE
)
port map (
sys_clk => sys_clk,
rst => rst,
led_en => led_enable,
led_out => blink
);

-- logic for the switch and leds
process(sw, blink)

begin

case sw is
-- 001 is sw0
when "001" =>
rgb_out(2) <= '0'; rgb_out(1) <= '0'; rgb_out(0) <= blink;  
-- 010 is sw1
when "010" =>
rgb_out(2) <= '0'; rgb_out(1) <= blink; rgb_out(0) <= '0';
-- 100 is sw2
when "100" =>
rgb_out(2) <= blink; rgb_out(1) <= '0'; rgb_out(0) <= '0';
-- when multiple switches are on
when others =>
rgb_out(2) <= '0'; rgb_out(1) <= '0'; rgb_out(0) <= '0';
end case;

end process;

end Behavioral;
