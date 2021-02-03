library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity T_FF is
 Port (
 T : in STD_LOGIC;
 clk : in STD_LOGIC;
 Q, QN : out STD_LOGIC
 );
end T_FF;
architecture T_FF of T_FF is
 signal mem : std_logic := '0';
begin
process (clk)
begin
 if T = '0' then null; -- no toggle, so do nothing
 elsif (clk'event and clk = '1') then
 mem <= not mem; -- rising edge of clock and T = 1, toggle stored value
 end if;
end process;
Q <= mem;
QN <= not mem;

end T_FF;