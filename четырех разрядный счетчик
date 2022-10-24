library ieee;
 use ieee.std_logic_1164.all;
 use std.env.stop;
 entity tff_sync_reset is
 port ( 
	clk :in std_logic; -- Clock input
	reset :in std_logic; -- Reset input
	start :in std_logic; --Start input
	rank0 :out std_logic; -- Q output
	rank1 :out std_logic; -- Q output
	rank2 :out std_logic; -- Q output
	rank3 :out std_logic -- Q output
 );
 end entity;
 architecture rtl of tff_sync_reset is 
 signal help0 :std_logic; 
 signal help1 :std_logic; 
 signal help2 :std_logic; 
 signal help3 :std_logic; 
 begin 
 process (clk) begin 
	if (reset = '0') then 
			help0 <= '0';
			help1 <= '0';
			help2 <= '0';
			help3 <= '0';
	else
		if(start = '1') then
			if (falling_edge(clk)) then 
				if (help0 = '1') then 
					if (help1 = '1') then 
						if (help2 = '1') then 
							help3 <= not help3; 
						end if;
						help2 <= not help2; 
					end if;
					help1 <= not help1; 
				end if;
				help0 <= not help0; 
			
		
			end if;
		end if;
	end if;
 end process;
 rank0 <= help0; 
 rank1 <= help1; 
 rank2 <= help2; 
 rank3 <= help3; 
 end architecture;
