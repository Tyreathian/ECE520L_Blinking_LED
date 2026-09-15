----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/31/2026 05:29:14 PM
-- Design Name: 
-- Module Name: blinking_led - Behavioral
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

entity blinking_led is
generic (
CLK_CYCLES_PER_TOGGLE : integer := 62500000
);
Port (
sys_clk: in std_logic;
rst : in std_logic;
led_en : in std_logic;
led_out : out std_logic
);
end blinking_led;

architecture Behavioral of blinking_led is
signal counter : integer range 0 to CLK_CYCLES_PER_TOGGLE-1 := 0; -- max value is 62,500,000 - 1, starting at 0
signal led_reg : std_logic := '0'; -- register to hold led_out value
begin

led_out <= led_reg;

process(sys_clk)
begin

if rising_edge(sys_clk) then
-- when reset is high or led is not enabled
if rst = '1' or led_en = '0' then
counter <= 0;
led_reg <= '0';
-- counter has reached max and needs to be reset to 0
else 
if counter = CLK_CYCLES_PER_TOGGLE - 1 then
led_reg <= not led_reg;
counter <= 0;
-- increment counter value by 1 until it reaches max
else
counter <= counter + 1;

end if; -- for rising edge 
end if; -- for reset case
end if; -- for max counter
end process;
end Behavioral;
