library ieee;
use ieee.std_logic_1164.all;

entity tb_tff_sync_reset is
end tb_tff_sync_reset;

architecture tb of tb_tff_sync_reset is

 component tff_sync_reset
 port (clk : in std_logic;
 reset : in std_logic;
 start : in std_logic;
 rank0 : out std_logic;
 rank1 : out std_logic;
 rank2 : out std_logic;
 rank3 : out std_logic);
 end component;

 signal clk : std_logic;
 signal reset : std_logic;
 signal start : std_logic;
 signal rank0 : std_logic;
 signal rank1 : std_logic;
 signal rank2 : std_logic;
 signal rank3 : std_logic;

 constant TbPeriod : time := 1000 ps; -- EDIT Put right period here
 signal TbClock : std_logic := '0';
 signal TbSimEnded : std_logic := '0';

begin

 dut : tff_sync_reset
 port map (clk => clk,
 reset => reset,
 start => start,
 rank0 => rank0,
 rank1 => rank1,
 rank2 => rank2,
 rank3 => rank3);

 -- Clock generation
 TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

 -- EDIT: Check that clk is really your main clock signal
 clk <= TbClock;

 stimuli : process
 begin
 -- EDIT Adapt initialization as needed
 start <= '1';

 -- Reset generation
 -- EDIT: Check that reset is really your reset signal
 reset <= '0';
 wait for 100 ps;
 reset <= '1';
 wait for 100 ps;

 -- EDIT Add stimuli here
 wait for 16 * TbPeriod;

 -- Stop the clock and hence terminate the simulation
 TbSimEnded <= '1';
 wait;
 end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_tff_sync_reset of tb_tff_sync_reset is
 for tb
 end for;
end cfg_tb_tff_sync_reset;
