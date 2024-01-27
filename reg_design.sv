module reg_design (

input clk,
input rst,
input wr_en,
input addr_vld,
input [2:0]addr,
input [31:0]din,

output reg [31:0] dout,
output reg dout_vld


);

reg [31:0]reg_a;
reg [31:0]reg_b;
reg [31:0]reg_c;
reg [31:0]reg_d;

always @(posedge clk or posedge rst) begin
	if (rst) begin
		dout <= 32'd0;
		dout_vld <=0;
	end
	else begin
		if(wr_en && addr_vld) begin
			dout_vld <=0;
			case (addr)
				2'b00: reg_a <= din;
				2'b10: reg_c <= din;
				2'b01: reg_b <= din;
				2'b11: reg_d <= din;
			endcase
		end

		else if (wr_en==0 && addr_vld==1) begin
			dout_vld <= 1;
			case (addr)
				2'b00: dout <= reg_a;
				2'b01: dout <= reg_b;
				2'b10: dout <= reg_c;
				2'b11: dout <= reg_d;
			endcase
		end
		else begin
			dout_vld <=0;
		end
	end
	
 end
 
 
 endmodule
