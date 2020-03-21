module fpadd(a,b,clk,out);
input[31:0]a,b;
input clk;
output [31:0]out;
wire [7:0]e1,e2,ex,ey,exy,ex1;
wire s1,s2,s,s3,sr,sn,sx1,sx2,sy1,sn3,sn4,sr1;
wire [23:0]m1,m2,mx,my,mxy;
wire [24:0]mxy1;
assign s1=a[31];
assign s2=b[31];
assign e1=a[30:23];
assign e2=b[30:23];
assign m1[23]=1'b1;
assign m2[23]=1'b1;
assign m1[22:0]=a[22:0];
assign m2[22:0]=b[22:0];
//submodule for compare and shfit
cmpshift as(e1[7:0],e2[7:0],s1,s2,m1[23:0],m2[23:0],clk,ex,ey,mx,my,s,sx1,sy1);
//sub module for mantissa addition
fadd as1(mx,my,sx1,sx2,s,ex,clk,mxy1,ex1,sn3,sn4,sr1);
//sub module for normalization
normalized as2(mxy1,sr1,sn3,sn4,s3,clk,ex1,exy,mxy);
assign out={1'b0,exy,mxy[22:0]};
endmodule
module normalized(mxy1,s,s1,s2,s3,clk,ex,exy,mxy);
input[24:0]mxy1;
input s,s1,s2,s3,clk;
input[7:0]ex;
output reg[7:0]exy;
output reg[23:0]mxy;
always@(posedge clk)
begin

mxy=mxy1[24:1];
exy=ex;
repeat(24)
begin
if(mxy[23]==1'b0)
begin
mxy=mxy<<1'b1;
exy=exy-8'b1;
end
end
end
endmodule

module fadd(a,b,s1,s2,sn,ex1,clk,out,ex2,sn3,sn4,sr1); //submodule for addition
input [23:0]a,b;
input[7:0]ex1;
input s1,s2,clk,sn;
output reg [7:0]ex2;
output reg[24:0]out;
output reg sn3,sn4,sr1;
always@(posedge clk)
begin
ex2=ex1;
sr1=sn;
sn3=s1;
sn4=s2;
out=a+b;
end
endmodule
module cmpshift(e1,e2,s1,s2,m1,m2,clk,ex,ey,mx,my,s,sx1,sy1); //module for compare &shift
input [7:0]e1,e2;
input [23:0]m1,m2;
input clk,s1,s2;
output reg[7:0]ex,ey;
output reg[23:0]mx,my;
output reg s,sx1,sy1;
reg [7:0]diff;
always@(posedge clk)
begin
sx1=s1;
sy1=s2;
if(e1==e2)
begin
ex=e1+8'b1;
ey=e2+8'b1;
mx=m1;
my=m2;
s=1'b1;
end
else if(e1>e2)
begin
diff=e1-e2;
ex=e1+8'b1;
ey=e1+8'b1;
mx=m1;
my=m2>>diff;
s=1'b1;
end
else
begin
diff=e2-e1;
ex=e2+8'b1;
ey=e2+8'b1;
mx=m2;
my=m1>>diff;
s=1'b0;
end
end
endmodule
