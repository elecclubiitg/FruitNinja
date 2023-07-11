-makelib xcelium_lib/xpm -sv \
  "C:/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "C:/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../../new_integ.gen/sources_1/ip/clk_40M/clk_40M_clk_wiz.v" \
  "../../../../new_integ.gen/sources_1/ip/clk_40M/clk_40M.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

