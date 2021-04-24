----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/02/24 09:18:00
-- Design Name: 
-- Module Name: tb_temp_cond - Behavioral
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

entity tb_temp_cond is
--  Port ( );
end tb_temp_cond;

architecture Behavioral of tb_temp_cond is
component temp_cond
    Port ( temp_ce_p : in STD_LOGIC_VECTOR (7 downto 0);
           temp_Fah_p : out STD_LOGIC_VECTOR (7 downto 0)
           );

end component;

    signal t1 : std_logic_vector ( 7 downto 0);
    signal t2 : std_logic_vector (7 downto 0);
    
begin
    
        u_temp_cond : temp_cond
            port map ( temp_ce_p => t1, temp_Fah_p => t2);
process
     begin
    t1 <= std_logic_vector(to_signed(61, 8)); -- 19
   
    wait for 10us;
    t1 <= std_logic_vector(to_signed(32, 8)); -- 10

    wait for 10us;
    t1 <= std_logic_vector(to_signed(0, 8)); -- 0
  
    wait for 10us;
    t1 <= std_logic_vector(to_signed(-16, 8)); -- 5
   wait for 10us;
    t1 <= std_logic_vector(to_signed(-122, 8)); -- 38
    wait;
    end process; 



end Behavioral;
