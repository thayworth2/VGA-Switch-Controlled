`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/29/2025 09:04:45 PM
// Design Name: 
// Module Name: vga_test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module vga_test(
    input clk,
    input reset,
    input [11:0] sw,
    output horizontal_sync,
    output vertical_sync,
    output [11:0] rgb
    );
    
    reg [11:0] rgb_reg;
    wire video_on;
    
    VGA_controller vga_c(.clk(clk), .reset(reset), .horizontal_sync(horizontal_sync), .vertical_sync(vertical_sync),
                         .video_on(video_on), .p_tick(), .x_pos(), .y_pos());
                         
    always@(posedge clk or posedge reset) begin
        if(reset)
            rgb_reg <= 0;
        else
            rgb_reg <= sw;
    end
    
    assign rgb = (video_on) ? rgb_reg : 12'b0;
    
endmodule
