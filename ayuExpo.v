module q1(input reset,input reset1,input clk,input [7:0] a,input [7:0] b,output [31:0] out,output ready);
        reg state;
        reg [31:0]m1;
        reg [7:0]m2;
        reg[31:0] outReg;
        reg readyReg;
        reg [7:0]  prevA;
        reg [7:0]  prevB;
    
        assign out = outReg;
        assign ready = readyReg;
    
        always @(posedge clk or negedge reset or negedge reset1)
        begin 
            if(reset==0 || reset1==0)
            begin
                prevA<=0;
                prevB<=0;
                state<=0;
                readyReg<=1;
                outReg<=0;
            end
            else if(readyReg==1 && (prevA!=a || prevB != b)) begin
                prevA<=a;
                prevB<=b;
                m1<=a;
                m2<=b;
                readyReg<=0;
                state<=1;
                outReg<=1;
            end
            else if(state==1) begin
                if(m2==0) begin
                    state<=0 ;
                    readyReg<=1 ;
                end    
                else begin
                    if(m2[0]==1)
                        outReg<=outReg*m1 ;
                    m2<=m2>>1 ;
                    m1<=m1*m1 ;
                end
            end
        end
    endmodule
