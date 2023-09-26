module mux2 #(parameter WIDTH = 32) (
input wire [WIDTH-1:0] d0, d1,
input wire s,
output wire [WIDTH-1:0] y
);
    assign y = s ? d1 : d0; //depends whether input from d1 or d0//
endmodule
