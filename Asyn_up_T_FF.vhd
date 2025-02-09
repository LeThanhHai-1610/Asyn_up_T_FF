library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Asyn_up_T_FF is
 port (
 clk_50, clk_hand : in STD_LOGIC;  --clk_hand: chinh clk = tay, 
 Q : out STD_LOGIC_VECTOR (3 downto 0)
 );
end Asyn_up_T_FF;
architecture Asyn_up_T_FF of Asyn_up_T_FF is
component T_FF    -- khai bao T_FF
 port (
 T : in STD_LOGIC;
 clk : in STD_LOGIC;
 Q, QN : out STD_LOGIC
 );
end component;
component Clock_Divider --khai bao bo chia tgian 50MHz -> 1Hz
 port (
 clk : in STD_LOGIC;
 clock_out : out STD_LOGIC
 );
end component;
signal all_T, S0, S1, S2, S3 : STD_LOGIC;  -- all_T: HIGH; S0, S1, S2, S3 : not(Q)
signal clk_1Hz : STD_LOGIC;
begin
-- use signal all_T to drive input T of all T flip-flops to logic '1';
all_T <= '1';
CLOCK: Clock_Divider port map (clk => clk_50, clock_out => clk_1Hz);
--khai bao PORT MAP; TFF0,... la LABEL
TFF0: T_FF port map (T => all_T, clk => clk_1Hz, Q => Q(0), QN => S0); --clk => clk_1Hz: rising edge; clk => not(clk_1Hz): falling edge
TFF1: T_FF port map (T => all_T, clk => S0, Q => Q(1), QN => S1);
TFF2: T_FF port map (T => all_T, clk => S1, Q => Q(2), QN => S2);
TFF3: T_FF port map (T => all_T, clk => S2, Q => Q(3), QN => S3);
end Asyn_up_T_FF;