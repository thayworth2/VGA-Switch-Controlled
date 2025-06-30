`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/29/2025 04:34:56 PM
// Design Name: 
// Module Name: VGA_controller
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


module VGA_controller(
    input clk,
    input reset,
    output video_on,
    output horizontal_sync,
    output vertical_sync,
    output p_tick,
    output [9:0] x_pos,
    output [9:0] y_pos
    );
    
    // horizontal width of screen
    parameter HD = 640;
    parameter HF = 48;
    parameter HB = 16;
    parameter HR = 96;
    parameter HMAX = HD + HF +HB +HR -1;
    
    // vertical width of screen
    parameter VD = 480;
    parameter VF = 10;
    parameter VB = 33;
    parameter VR = 2;
    parameter VMAX = VD + VF + VB + VR - 1;
    
    // Generate 25MHz clock rate from 100MHz clock in Basys3 Board
    // 
    //
    reg [1:0] r_25MHz;
    wire w_25MHz;
    
    always@(posedge clk or posedge reset) begin
        if(reset)
            r_25MHz = 0;
        else
            r_25MHz = r_25MHz + 1;
    end
    
    assign w_25MHz = (r_25MHz == 0)? 1 : 0;
    
    // 
    reg [9:0] h_count_reg, h_count_next;
    reg [9:0] v_count_reg, v_count_next;
    
    reg v_sync_reg, h_sync_reg;
    wire v_sync_next, h_sync_next;
    
    // next state logic
    always@(posedge clk or posedge reset) begin
        if(reset) begin
            v_count_reg <= 0;
            h_count_reg <= 0;
            v_sync_reg <= 0;
            h_sync_reg <= 0;
        end else begin
            v_count_reg <= v_count_next;
            h_count_reg <= h_count_next;
            v_sync_reg <= v_sync_next;
            h_sync_reg <= h_sync_next;
        end
    end
    
    // horizontal counter
    always@(posedge w_25MHz or posedge reset) begin
        if(reset)
            h_count_next = 0;
        else
            if(h_count_reg == HMAX)
                h_count_next = 0;
            else
                h_count_next = h_count_reg + 1;
    end
    
    // vertical counter
   always@(posedge w_25MHz or posedge reset) begin
        if(reset)
            v_count_next = 0;
        else
            if(h_count_reg == HMAX)
                if(v_count_reg == VMAX)
                    v_count_next = 0;
                else
                    v_count_next = v_count_reg + 1;
    end
    
    assign h_sync_next = (h_count_reg >= (HD+HB) && h_count_reg <= (HD+HB+HR-1));
    
    assign v_sync_next = (v_count_reg >= (VD+VB) && v_count_reg <= (VD+VB+VR-1));
    
    assign video_on = (h_count_reg < HD) && (v_count_reg < VD);
    
    assign horizontal_sync = h_sync_reg;
    assign vertical_sync = v_sync_reg;
    assign x_pos = h_count_reg;
    assign y_pos = v_count_reg;
    assign p_tick = w_25MHz;
    
    
endmodule
