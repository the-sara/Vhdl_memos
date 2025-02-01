--library declaration:
library ieee;
use ieee.std_logic_1164.all;

--the entity:
entity RAM4x8 is
    port(
        clk : in std_logic;
        rd, we : in std_logic;
        addr : in integer  range 0 to 3;
        data_in : in std_logic_vector(7 downto 0);
        data_out : out std_logic_vector(7 downto 0)
    );
end entity;

-- the architecture:
architecture logic of RAM4x8 is
    --array type for the ram:
    type my_array is array(0 to 3) of std_logic_vector(7 downto 0);
    signal my_ram: my_array := (x"a5", x"b7", x"e9", x"f1");
begin
    process(clk, rd)
    begin
        if clk'event and clk='1' then
            if we='1' then
                my_ram(addr) <= data_in;
            end if;
            if rd='1' then
                data_out <= my_ram(addr);
            else
                data_out <= (others => 'Z');
            end if;
        end if;
    end process;
end logic;
