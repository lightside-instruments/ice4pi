module top(input clk,
 input mio38_spi0_sclk,
 output mio42_spi0_miso,
 input  mio43_spi0_mosi,
 input mio40_ps_gpio1_3, //ce1 on board96 side
 //input mio44_ps_gpio1_4, //gpio to use as alternative ce on board96 side
 input mio36_ps_gpio1_0, //ice_crest on board96 side


 output pi_ce0,
 input pi_miso0,
 output pi_mosi0,
 output pi_sclk0,
 output pi_gpio24 //ice_crest on pi side
 );
   
   assign mio42_spi0_miso = pi_miso0;
   assign pi_mosi0 = mio43_spi0_mosi;
   assign pi_sclk0 = mio38_spi0_sclk;
   assign pi_ce0 = mio40_ps_gpio1_3;
   assign pi_gpio24 = mio36_ps_gpio1_0; //ice_creset
//   assign pi_gpio24 = 1'b1; //ice_creset

endmodule // top
