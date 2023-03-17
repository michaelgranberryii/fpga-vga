library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use std.env.stop;

entity vga_cnrl_tb is
--  Port ( );
end vga_cnrl_tb;

architecture Behavioral of vga_cnrl_tb is
    type array_1 is array (0 to 10) of integer;
    signal sw_ar : array_1 := (0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
    
    type array_2 is array (0 to 4) of integer;
    signal btn_ar : array_2 := (0, 1, 2, 4, 8);
    
    signal clk_tb : std_logic := '0';
    signal sw_tb : std_logic_vector(3 downto 0);
    signal btn_tb : std_logic_vector(3 downto 0);
    signal VGA_HS_O_tb : std_logic;
    signal VGA_VS_O_tb : std_logic;
    signal VGA_R_tb : std_logic_vector(3 downto 0);
    signal VGA_G_tb : std_logic_vector(3 downto 0);
    signal VGA_B_tb : std_logic_vector(3 downto 0);
    constant CP : time := 2 ns;

begin
    uut: entity work.top port map(clk_tb, sw_tb, btn_tb, VGA_HS_O_tb, VGA_VS_O_tb, VGA_R_tb, VGA_G_tb, VGA_B_tb);

    clock: process
    begin
        clk_tb <= not clk_tb;
        wait for CP/2;
    end process;

    test: process
    begin
        l1: for i in 0 to 10 loop
            sw_tb <= std_logic_vector(to_unsigned(sw_ar(i), sw_tb'length));
            if sw_ar(i) = 5 or sw_ar(i) = 6 or sw_ar(i) = 7 or sw_ar(i) = 8 then
                l2: for j in 0 to 4 loop
                    btn_tb <= std_logic_vector(to_unsigned(btn_ar(j), btn_tb'length));
                    wait for 10 us;
                end loop;
            else
                btn_tb <= "0000";
            end if;
        wait for 40 us;
        
        end loop;
        stop;
    end process;
end Behavioral;
