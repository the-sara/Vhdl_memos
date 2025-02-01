--library declaration:
library ieee;
use ieee.std_logic_1164.all;

--the entity:
entity ROM4x8 is
    port(
        addr: in integer range 0 to 3;
        rd: in std_logic;
        clk: in std_logic;
        data_out: out std_logic_vector(7 downto 0)
    );
end entity;

--the architecture:
architecture logic of ROM4x8 is
    --array type for the rom:
    type my_array is array(0 to 3) of std_logic_vector(7 downto 0);
    constant my_rom: my_array := (x"a5", x"b7", x"e9", x"f1");
begin
    process(clk, rd)
    begin
        if rd='0' then
            data_out <= (others => 'Z');
        elsif clk'event and clk='1' then
            data_out <= my_rom(addr);
        end if;
    end process;
end logic;
