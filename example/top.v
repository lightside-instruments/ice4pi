module top(input clk,

           //i2c slave interface
           inout i2c_sda, input i2c_scl,

           //sfp and leds x6
           output reg [5:0] led_blue,
           output reg [5:0] led_green,
           input [5:0] sfp_tx_disable,
           output [5:0] sfp_scl,
           output [5:0] sfp_rs0,
           output [5:0] sfp_rs1,
           inout [5:0] sfp_sda,
           input [5:0] sfp_mod_abs,
           input [5:0] sfp_rx_los,
           input [5:0] sfp_tx_fault);

   reg rst = 1'b1;
   reg [3:0] dummy;
   reg [7:0] pmod;
   wire [11:0] rot;
   wire [7:0] led_blue_i2c;
   wire [7:0] led_green_i2c;
   reg [27:0] startup_cnt = 28'd0;

   rot rot0(.clk(clk), .rot(rot));

   i2cSlaveTop i2c0(.clk(clk), .rst(rst), .sda(i2c_sda), .scl(i2c_scl),
                    //output regs 0-3
                    .myReg0(led_blue_i2c),
                    .myReg1(led_green_i2c),
                    //input regs 4-7
                    .myReg4({sfp_mod_abs, 2'b00}),
                    .myReg5({sfp_rx_los, 2'b00}),
                    .myReg6({sfp_tx_fault, 2'b00})
);

   always @ (posedge clk)
   begin
      if(startup_cnt < 28'd144000000)
        begin
            rst <= 1'b1;
            startup_cnt <= startup_cnt + 1;
            {led_green, led_blue} <= rot;
        end
      else
        begin
            rst <= 1'b0;
//            led_green <= led_green_i2c[5:0];
//            led_blue <= led_blue_i2c[5:0];
            led_blue <= sfp_mod_abs;
            led_green <= sfp_rx_los;
        end
   end

endmodule // top
