library ieee;
use ieee.std_logic_1164.all;

entity fechadura is 
port(
	ck: in std_logic;
	entrada: in std_logic;
	u : out std_logic;
	start : in std_logic
	
);
end fechadura;

architecture machine of fechadura is
	type STATE_TYPE is (S0, S1, S2, S3);
	signal estado: STATE_TYPE;
begin
	process(ck, start)
	begin
		if start = '1' then
			estado <= S0;
		elsif rising_edge(ck) then
			case estado is
		when S0 =>
			if entrada = '1' then
				estado <= S1;
			else
				estado <= s0;
			end if;
		when S1 =>
			if entrada = '0' then
				estado <= S2;
			else
				estado <= S0;
			end if;
		when S2 =>
			if entrada = '1' then
				estado <= S3;
			else
				estado <= s0;
			end if;
		when S3 =>
			if entrada = '1' then
				estado <= S0;
			else
				estado <= s0;
			end if;
		end case;
		end if;
	end process;
	u <= '1' when entrada = '1' and estado = S3
	else '0';
end machine;