module test;

reg reset,clk;
reg[7:0] a,b;
wire [31:0] out;
wire rdy;
reg reset1;

q1 test1(.reset(reset), .reset1(reset1), .clk(clk), .a(a), .b(b), .out(out), .ready(rdy));

initial begin
    clk= 1'b0;
    reset1=1;
    forever #1  clk=~clk;     
end

initial begin 
	$dumpfile("ayuWave.vcd");
	$dumpvars(0,test);
	reset=0;#1
	reset=1;#1

    a=5 ; b = 3 ;#20
    $display("x=%d n=%d ans=%d",a,b,out);

    a=10 ; b = 9; reset = 1 ;#20
    $display("x=%d n=%d ans=%d",a,b,out);

    a=10 ; b = 0 ;#20
    $display("x=%d n=%d ans=%d",a,b,out);

    a=0 ; b = 0;#20
    $display("x=%d n=%d ans=%d",a,b,out);

    a=0 ; b = 1;#20
    $display("x=%d n=%d ans=%d",a,b,out);


    a=2;b=3;#4
    reset=0;#2
    reset=1;#2
    $display("x=%d n=%d ans=%d",a,b,out);

    a=4 ; b = 9 ;#20
    $display("x=%d n=%d ans=%d",a,b,out);

    $finish();
    end
endmodule