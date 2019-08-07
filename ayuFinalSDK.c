#include "xparameters.h"
#include "xil_io.h"
#include "xbasic_types.h"

int main(){

	xil_printf("Exponentiation Begins!\n\n\r");
	u32 x,product;
    
    //x=3 n=2
	Xil_Out32(XPAR_AYUIPFINAL_0_S00_AXI_BASEADDR, 0x80000203);
	x = Xil_In32(XPAR_AYUIPFINAL_0_S00_AXI_BASEADDR);
	xil_printf("x=%d n=%d\n\n\r", x&0x000000FF, (x&(0x0000FF00))>>8);
	while(!Xil_In32(XPAR_AYUIPFINAL_0_S00_AXI_BASEADDR + 8));
	product = Xil_In32(XPAR_AYUIPFINAL_0_S00_AXI_BASEADDR + 4);
	xil_printf("product=%d\n\n\r", product);

   // x=10 n=9
	Xil_Out32(XPAR_AYUIPFINAL_0_S00_AXI_BASEADDR, 0x8000090A);
	x = Xil_In32(XPAR_AYUIPFINAL_0_S00_AXI_BASEADDR);
	while(!Xil_In32(XPAR_AYUIPFINAL_0_S00_AXI_BASEADDR + 8));
	xil_printf("x=%d n=%d\n\n\r", x&0x000000FF, (x&(0x0000FF00))>>8);
	product = Xil_In32(XPAR_AYUIPFINAL_0_S00_AXI_BASEADDR + 4);
	xil_printf("product=%d\n\n\r", product);

    //x=10 n=0
	Xil_Out32(XPAR_AYUIPFINAL_0_S00_AXI_BASEADDR, 0x8000000A);
	x = Xil_In32(XPAR_AYUIPFINAL_0_S00_AXI_BASEADDR);
	xil_printf("x=%d n=%d\n\n\r", x&0x000000FF, (x&(0x0000FF00))>>8);
	while(!Xil_In32(XPAR_AYUIPFINAL_0_S00_AXI_BASEADDR + 8));
	product = Xil_In32(XPAR_AYUIPFINAL_0_S00_AXI_BASEADDR + 4);
	xil_printf("product=%d\n\n\r", product);

	return 0;
}
