--MIT License
--
-- Copyright (c) 2020, Bert Verrycken, bertv@verrycken.com
--
--Permission is hereby granted, free of charge, to any person obtaining a copy
--of this software and associated documentation files (the "Software"), to deal
--in the Software without restriction, including without limitation the rights
--to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
--copies of the Software, and to permit persons to whom the Software is
--furnished to do so, subject to the following conditions:
--
--The above copyright notice and this permission notice shall be included in all
--copies or substantial portions of the Software.
--
--THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
--IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
--FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
--AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
--LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
--OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
--SOFTWARE.

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- AXI Lite package
use work.axil_pkg.all;
use work.axi_pkg.axi_response_ok;
use work.axi_pkg.axi_response_decerr;

architecture rtl of axi_arbiter is
begin

  -- AXI Lite Slave (axils) master to slave (m2s) bus is the AXI Lite m2s
  axils_m2s             <= axilm_m2s;
  -- AXI Lite Master (axilm) slave to master (s2m) is the slave answer
  axilm_s2m             <= axils_s2m;

  axils_rsel            <= (axilm_m2s.ar.valid = '1');
  axils_wsel            <= (axilm_m2s.aw.valid = '1');

end architecture;
