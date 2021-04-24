----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/02/24 00:21:59
-- Design Name: 
-- Module Name: temp_cond - Behavioral
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

entity temp_cond is
    Port ( temp_ce_p : in std_logic_vector (7 downto 0); -- 输入摄氏度
         temp_Fah_p: out std_logic_vector (7 downto 0));-- 要输出的华氏度
end temp_cond;

architecture Behavioral of temp_cond is

component mul_q
Port (  m1 : in std_logic_vector (7 downto 0);
        m2 : in std_logic_vector (7 downto 0);
        m3 : out std_logic_vector (7 downto 0));
end component;

component adder_so
    Port (  a1 : in std_logic_vector (7 downto 0);
        a2 : in std_logic_vector (7 downto 0);
        a3 : out std_logic_vector (7 downto 0));
end component;

    signal a, b : std_logic_vector(7 downto 0);
    signal m_res : std_logic_vector(7 downto 0);

begin
          
	-- the two following lines are incomplete!
	-- puts the correct value for a and b
    a <= std_logic_vector(to_signed(89,8));  -- q7
    b <= std_logic_vector(to_signed(40,8));  -- q7

	-- instantiate here your adder
    u_adder_so : adder_so  -- Tf_prime = Tc_prime*a + b
        port map ( a1 => m_res, a2 => b, a3 => temp_Fah_p);
    -- instantiate here your multiplier
    u_mul_q : mul_q  -- = Tc_prime*a 
        port map ( m1 => temp_ce_p, m2 => a, m3 => m_res);
        
end Behavioral;
