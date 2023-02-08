
module rot(input clk, output reg [11:0] rot);
   
   reg ready = 0;
   reg [23:0]     divider;
   
   always @(posedge clk) begin
      if (ready) 
        begin
           if (divider == 12000000) 
             begin
                divider <= 0;
                rot <= {rot[10:0], rot[11]};
             end
           else 
             divider <= divider + 1;
        end
      else 
        begin
           ready <= 1;
           rot <= 12'b111111111110;
           divider <= 0;
        end
   end
   
   //assign D1 = rot[0];
   //assign D2 = rot[1];
   //assign D3 = rot[2];
   //assign D4 = rot[3];
   //assign D5 = 1;

endmodule // top
