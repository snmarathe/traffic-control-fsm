module traffic_fsm (
  input clk, rst,
  output reg [2:0] north, south, east, west
);

//States
parameter NORTH_G   = 3'b000;
parameter NORTH_Y   = 3'b001;
parameter EAST_G    = 3'b010;
parameter EAST_Y    = 3'b011;
parameter SOUTH_G   = 3'b100;
parameter SOUTH_Y   = 3'b101;
parameter WEST_G    = 3'b110;
parameter WEST_Y    = 3'b111;

reg [2:0] curr_state, next_state;

//initial state
initial
begin
  curr_state = NORTH_G;
end  

//always block for state change
always @ (posedge clk or posedge rst)
begin
  if (rst) curr_state <= NORTH_G;
  else curr_state <= next_state;
end

//always block to decide next_state
always @ (posedge clk)
begin
  case(curr_state)
    NORTH_G: begin
              next_state = NORTH_Y;
              north   = 3'b010;
              south   = 3'b001;
              west    = 3'b001;
              east    = 3'b001;
             end
             
    NORTH_Y: begin
              next_state = EAST_G;
              north   = 3'b001;
              south   = 3'b001;
              west    = 3'b001;
              east    = 3'b100;
             end
             
    EAST_G: begin
              next_state = EAST_Y;
              north   = 3'b001;
              south   = 3'b001;
              west    = 3'b001;
              east    = 3'b010;
             end             
             
    EAST_Y: begin
              next_state = SOUTH_G;
              north   = 3'b001;
              south   = 3'b100;
              west    = 3'b001;
              east    = 3'b001;
             end    
             
    SOUTH_G: begin
              next_state = SOUTH_Y;
              north   = 3'b001;
              south   = 3'b010;
              west    = 3'b001;
              east    = 3'b001;
             end
             
    SOUTH_Y: begin
              next_state = WEST_G;
              north   = 3'b001;
              south   = 3'b001;
              west    = 3'b100;
              east    = 3'b001;
             end  
             
    WEST_G: begin
              next_state = WEST_Y;
              north   = 3'b001;
              south   = 3'b001;
              west    = 3'b010;
              east    = 3'b001;
            end               
            
    WEST_Y: begin
              next_state = NORTH_G;
              north   = 3'b100;
              south   = 3'b001;
              west    = 3'b001;
              east    = 3'b001;
            end              
  endcase
 end

endmodule
 
             
                 


