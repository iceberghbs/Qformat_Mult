----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/02/21 11:45:23
-- Design Name: 
-- Module Name: adder_so - Behavioral
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
use ieee.numeric_std.all; 

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity adder_so is
    Port (  a1 : in std_logic_vector (7 downto 0);
            a2 : in std_logic_vector (7 downto 0);
            a3 : out std_logic_vector (7 downto 0)
--            ov : out std_logic
            );
end adder_so;

architecture Behavioral of adder_so is
    signal a1i, a2i, a3i : signed(8 downto 0);
begin
    a1i <= signed(a1(7) & a1);  -- 原码补位
    a2i <= signed(a2(7) & a2);  -- 原码补位
    a3i <= a1i + a2i;  -- 原码的运算规则
    a3 <= std_logic_vector(a3i(7 downto 0));  -- 舍去多余符号位 
--    ov <= std_logic(a3i(8) xor a3i(7));


end Behavioral;
