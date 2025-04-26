// Code your design here
module gray_code_counter #(parameter WIDTH = 3) (
    input  logic                  en,
  	input  logic                  clk,// Clock signal
    input  logic                  rst_n,
  output logic [2:0]      gray_code, // Gray code output
  output logic [2:0]   count
);

    logic [WIDTH-1:0] binary_count; // Binary counter

    // Binary counter logic
    always_ff @(posedge clk) begin
        if (!rst_n) 
            binary_count <= 0; // Reset binary counter
      else if (en)
            binary_count <= binary_count + 1; // Increment binary counter
    end

    // Convert binary counter to Gray Code
    always_comb begin
        gray_code = binary_count ^ (binary_count >> 1);
    end
	
  	 assign count = binary_count;
   
  always @(posedge clk)begin
    //$display (" %0d %0d %0d %0d",gray_code,en,rst_n,count);
  end
  
endmodule
