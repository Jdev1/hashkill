#define ROTATE(a,b) ((a) << (b)) + ((a) >> (32-(b)))

#ifdef SM21

__kernel void __attribute__((reqd_work_group_size(128, 1, 1)))
sha1_saltpass_short( __global uint4 *dst, uint4 input, uint size,  uint8 chbase,  __global uint *found_ind, uint16 salt, __global uint *found, __global  uint *table,  uint4 singlehash) 
{  



uint4 SIZE;  
uint i,ib,ic,id,ie;  
uint4 t1,t2,t3;
uint4 A,B,C,D,E,K;
uint4 tmp1, l,tmp2,chbase1; 
uint4 w0,w1,w2,w3; 
uint4 w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w16,temp; 
uint4 w[16];
#define m 0x00FF00FF
#define m2 0xFF00FF00 

uint4 K0 = (uint4)0x5A827999;
uint4 K1 = (uint4)0x6ED9EBA1;
uint4 K2 = (uint4)0x8F1BBCDC;
uint4 K3 = (uint4)0xCA62C1D6;

uint4 H0 = (uint4)0x67452301;
uint4 H1 = (uint4)0xEFCDAB89;
uint4 H2 = (uint4)0x98BADCFE;
uint4 H3 = (uint4)0x10325476;
uint4 H4 = (uint4)0xC3D2E1F0;
#define S1 1
#define S2 5
#define S3 30  
#define Sl 8
#define Sr 24  

chbase1=(uint4)(chbase.s0,chbase.s1,chbase.s2,chbase.s3);

SIZE = (uint4)salt.sF; 

i = table[get_global_id(0)];
ib=i&255;
ic=(i>>8)&255;
id=(i>>16)&255;
ie=(i>>24)&255;


w[0] = (uint4)salt.s0;
w[1] = (uint4)salt.s1;
w[2] = (uint4)salt.s2;
w[3] = (uint4)salt.s3;
w[4] = (uint4)salt.s4;
w[5] = (uint4)salt.s5;
w[6] = (uint4)salt.s6;
w[7] = (uint4)salt.s7;
w[8] = (uint4)salt.s8;
w[9] = (uint4)salt.s9;
w[10] = (uint4)salt.sA;


w[salt.sE>>2] |= (uint4)ib<<((salt.sE&3)<<3);
w[(salt.sE+1)>>2] |= (uint4)ic<<(((salt.sE+1)&3)<<3);
w[(salt.sE+2)>>2] |= (uint4)id<<(((salt.sE+2)&3)<<3);
w[(salt.sE+3)>>2] |= (uint4)ie<<(((salt.sE+3)&3)<<3);
w[(salt.sE+4)>>2] |= chbase1<<(((salt.sE+4)&3)<<3);

w0=w[0];
w1=w[1];
w2=w[2];
w3=w[3];
w4=w[4];
w5=w[5];
w6=w[6];
w7=w[7];
w8=w[8];
w9=w[9];
w10=w[10];
w11=w12=w13=w14=w16=0;

A=H0;  
B=H1;  
C=H2;  
D=H3;  
E=H4;  


#define F_00_19(b,c,d)  ((((c) ^ (d)) & (b)) ^ (d))
#define F_20_39(b,c,d)  ((c) ^ (b) ^ (d))  
#define F_40_59(b,c,d)  (((b) & (c)) | (((b)|(c)) & (d)))  
#define F_60_79(b,c,d)  F_20_39(b,c,d) 


#define Endian_Reverse32(a) { l=(a);tmp1=ROTATE(l,Sl);tmp2=ROTATE(l,Sr); (a)=(tmp1 & m)|(tmp2 & m2); } 
#define ROTATE1(a, b, c, d, e, x) e = e + ROTATE(a,S2) + F_00_19(b,c,d) + x; e = e + K; b = ROTATE(b,S3) 
#define ROTATE1_NULL(a, b, c, d, e)  e = e + ROTATE(a,S2) + F_00_19(b,c,d) + K; b = ROTATE(b,S3)
#define ROTATE2_F(a, b, c, d, e, x) e = e + ROTATE(a,S2) + F_20_39(b,c,d) + x + K; b = ROTATE(b,S3) 
#define ROTATE3_F(a, b, c, d, e, x) e = e + ROTATE(a,S2) + F_40_59(b,c,d) + x + K; b = ROTATE(b,S3)
#define ROTATE4_F(a, b, c, d, e, x) e = e + ROTATE(a,S2) + F_60_79(b,c,d) + x + K; b = ROTATE(b,S3)



K = K0;
Endian_Reverse32(w0);  
ROTATE1(A, B, C, D, E, w0);
Endian_Reverse32(w1);  
ROTATE1(E, A, B, C, D, w1);
Endian_Reverse32(w2);  
ROTATE1(D, E, A, B, C, w2);
Endian_Reverse32(w3);  
ROTATE1(C, D, E, A, B, w3);
Endian_Reverse32(w4);  
ROTATE1(B, C, D, E, A, w4);
Endian_Reverse32(w5);  
ROTATE1(A, B, C, D, E, w5);
Endian_Reverse32(w6);  
ROTATE1(E, A, B, C, D, w6);
Endian_Reverse32(w7);  
ROTATE1(D, E, A, B, C, w7);
ROTATE1_NULL(C, D, E, A, B);
ROTATE1_NULL(B, C, D, E, A);
ROTATE1_NULL(A, B, C, D, E);
ROTATE1_NULL(E, A, B, C, D);
ROTATE1_NULL(D, E, A, B, C);
ROTATE1_NULL(C, D, E, A, B);
ROTATE1_NULL(B, C, D, E, A);

ROTATE1(A, B, C, D, E, SIZE);  

w16 = ROTATE((w13 ^ w8 ^ w2 ^ w0),S1);ROTATE1(E,A,B,C,D,w16);
w0 = ROTATE((w14 ^ w9 ^ w3 ^ w1),S1);ROTATE1(D,E,A,B,C,w0); 
w1 = ROTATE((SIZE ^ w10 ^ w4 ^ w2),S1); ROTATE1(C,D,E,A,B,w1); 
w2 = ROTATE((w16 ^ w11 ^ w5 ^ w3),S1);  ROTATE1(B,C,D,E,A,w2); 


K = K1;

w3 = ROTATE((w0 ^ w12 ^ w6 ^ w4),S1); ROTATE2_F(A, B, C, D, E, w3);
w4 = ROTATE((w1 ^ w13 ^ w7 ^ w5),S1); ROTATE2_F(E, A, B, C, D, w4);
w5 = ROTATE((w2 ^ w14 ^ w8 ^ w6),S1); ROTATE2_F(D, E, A, B, C, w5);
w6 = ROTATE((w3 ^ SIZE ^ w9 ^ w7),S1);ROTATE2_F(C, D, E, A, B, w6);
w7 = ROTATE((w4 ^ w16 ^ w10 ^ w8),S1); ROTATE2_F(B, C, D, E, A, w7);
w8 = ROTATE((w5 ^ w0 ^ w11 ^ w9),S1); ROTATE2_F(A, B, C, D, E, w8);
w9 = ROTATE((w6 ^ w1 ^ w12 ^ w10),S1); ROTATE2_F(E, A, B, C, D, w9);
w10 = ROTATE((w7 ^ w2 ^ w13 ^ w11),S1); ROTATE2_F(D, E, A, B, C, w10); 
w11 = ROTATE((w8 ^ w3 ^ w14 ^ w12),S1); ROTATE2_F(C, D, E, A, B, w11); 
w12 = ROTATE((w9 ^ w4 ^ SIZE ^ w13),S1); ROTATE2_F(B, C, D, E, A, w12);
w13 = ROTATE((w10 ^ w5 ^ w16 ^ w14),S1); ROTATE2_F(A, B, C, D, E, w13);
w14 = ROTATE((w11 ^ w6 ^ w0 ^ SIZE),S1); ROTATE2_F(E, A, B, C, D, w14);
SIZE = ROTATE((w12 ^ w7 ^ w1 ^ w16),S1); ROTATE2_F(D, E, A, B, C, SIZE);
w16 = ROTATE((w13 ^ w8 ^ w2 ^ w0),S1); ROTATE2_F(C, D, E, A, B, w16);  
w0 = ROTATE(w14 ^ w9 ^ w3 ^ w1,S1); ROTATE2_F(B, C, D, E, A, w0);  
w1 = ROTATE(SIZE ^ w10 ^ w4 ^ w2,S1); ROTATE2_F(A, B, C, D, E, w1);
w2 = ROTATE(w16 ^ w11 ^ w5 ^ w3,S1); ROTATE2_F(E, A, B, C, D, w2); 
w3 = ROTATE(w0 ^ w12 ^ w6 ^ w4,S1); ROTATE2_F(D, E, A, B, C, w3);  
w4 = ROTATE(w1 ^ w13 ^ w7 ^ w5,S1);ROTATE2_F(C, D, E, A, B, w4);
w5 = ROTATE(w2 ^ w14 ^ w8 ^ w6,S1); ROTATE2_F(B, C, D, E, A, w5);  
K = K2;

w6 = ROTATE(w3 ^ SIZE ^ w9 ^ w7, S1); ROTATE3_F(A, B, C, D, E, w6);
w7 = ROTATE(w4 ^ w16 ^ w10 ^ w8, S1); ROTATE3_F(E, A, B, C, D, w7);
w8 = ROTATE(w5 ^ w0 ^ w11 ^ w9, S1); ROTATE3_F(D, E, A, B, C, w8); 
w9 = ROTATE(w6 ^ w1 ^ w12 ^ w10, S1); ROTATE3_F(C, D, E, A, B, w9);
w10 = ROTATE(w7 ^ w2 ^ w13 ^ w11, S1); ROTATE3_F(B, C, D, E, A, w10);  
w11 = ROTATE(w8 ^ w3 ^ w14 ^ w12, S1); ROTATE3_F(A, B, C, D, E, w11);  
w12 = ROTATE(w9 ^ w4 ^ SIZE ^ w13, S1); ROTATE3_F(E, A, B, C, D, w12); 
w13 = ROTATE(w10 ^ w5 ^ w16 ^ w14, S1); ROTATE3_F(D, E, A, B, C, w13); 
w14 = ROTATE(w11 ^ w6 ^ w0 ^ SIZE, S1); ROTATE3_F(C, D, E, A, B, w14); 
SIZE = ROTATE(w12 ^ w7 ^ w1 ^ w16, S1); ROTATE3_F(B, C, D, E, A, SIZE);
w16 = ROTATE(w13 ^ w8 ^ w2 ^ w0, S1); ROTATE3_F(A, B, C, D, E, w16);
w0 = ROTATE(w14 ^ w9 ^ w3 ^ w1, S1); ROTATE3_F(E, A, B, C, D, w0); 
w1 = ROTATE(SIZE ^ w10 ^ w4 ^ w2, S1); ROTATE3_F(D, E, A, B, C, w1);
w2 = ROTATE(w16 ^ w11 ^ w5 ^ w3, S1); ROTATE3_F(C, D, E, A, B, w2);
w3 = ROTATE(w0 ^ w12 ^ w6 ^ w4, S1); ROTATE3_F(B, C, D, E, A, w3); 
w4 = ROTATE(w1 ^ w13 ^ w7 ^ w5, S1); ROTATE3_F(A, B, C, D, E, w4); 
w5 = ROTATE(w2 ^ w14 ^ w8 ^ w6, S1); ROTATE3_F(E, A, B, C, D, w5); 
w6 = ROTATE(w3 ^ SIZE ^ w9 ^ w7, S1); ROTATE3_F(D, E, A, B, C, w6);
w7 = ROTATE(w4 ^ w16 ^ w10 ^ w8, S1); ROTATE3_F(C, D, E, A, B, w7);
w8 = ROTATE(w5 ^ w0 ^ w11 ^ w9, S1); ROTATE3_F(B, C, D, E, A, w8); 


K = K3;

w9 = ROTATE(w6 ^ w1 ^ w12 ^ w10, S1); ROTATE4_F(A, B, C, D, E, w9);
w10 = ROTATE(w7 ^ w2 ^ w13 ^ w11, S1); ROTATE4_F(E, A, B, C, D, w10);  
w11 = ROTATE(w8 ^ w3 ^ w14 ^ w12, S1); ROTATE4_F(D, E, A, B, C, w11);  
w12 = ROTATE(w9 ^ w4 ^ SIZE ^ w13, S1); ROTATE4_F(C, D, E, A, B, w12); 
w13 = ROTATE(w10 ^ w5 ^ w16 ^ w14, S1); ROTATE4_F(B, C, D, E, A, w13); 
w14 = ROTATE(w11 ^ w6 ^ w0 ^ SIZE, S1); ROTATE4_F(A, B, C, D, E, w14); 
SIZE = ROTATE(w12 ^ w7 ^ w1 ^ w16, S1); ROTATE4_F(E, A, B, C, D, SIZE);
w16 = ROTATE(w13 ^ w8 ^ w2 ^ w0, S1); ROTATE4_F(D, E, A, B, C, w16);
w0 = ROTATE(w14 ^ w9 ^ w3 ^ w1, S1); ROTATE4_F(C, D, E, A, B, w0); 
w1 = ROTATE(SIZE ^ w10 ^ w4 ^ w2, S1); ROTATE4_F(B, C, D, E, A, w1);
w2 = ROTATE(w16 ^ w11 ^ w5 ^ w3,S1); ROTATE4_F(A, B, C, D, E, w2); 
w3 = ROTATE(w0 ^ w12 ^ w6 ^ w4,S1); ROTATE4_F(E, A, B, C, D, w3);  
w4 = ROTATE(w1 ^ w13 ^ w7 ^ w5,S1); ROTATE4_F(D, E, A, B, C, w4);  
w5 = ROTATE(w2 ^ w14 ^ w8 ^ w6,S1); ROTATE4_F(C, D, E, A, B, w5);  
w6 = ROTATE(w3 ^ SIZE ^ w9 ^ w7,S1); ROTATE4_F(B, C, D, E, A, w6); 
w7 = ROTATE(w4 ^ w16 ^ w10 ^ w8,S1); ROTATE4_F(A, B, C, D, E, w7); 
#ifdef SINGLE_MODE
//if (all((uint4)singlehash.y != E)) return;
#endif
w8 = ROTATE(w5 ^ w0 ^ w11 ^ w9,S1); ROTATE4_F(E, A, B, C, D, w8);  
w9 = ROTATE(w6 ^ w1 ^ w12 ^ w10,S1); ROTATE4_F(D, E, A, B, C, w9); 
w10 = ROTATE(w7 ^ w2 ^ w13 ^ w11,S1); ROTATE4_F(C, D, E, A, B, w10);
w11 = ROTATE(w8 ^ w3 ^ w14 ^ w12,S1); ROTATE4_F(B, C, D, E, A, w11);



A=A+H0;B=B+H1;C=C+H2;D=D+H3;E=E+H4;
Endian_Reverse32(A);
Endian_Reverse32(B);
Endian_Reverse32(C);
Endian_Reverse32(D);
Endian_Reverse32(E);

if (all((uint4)singlehash.x!=A)) return;
if (all((uint4)singlehash.z!=C)) return;


found[0] = 1;
found_ind[get_global_id(0)] = 1;

dst[(get_global_id(0)*5)] = (uint4)(A.s0,B.s0,C.s0,D.s0);  
dst[(get_global_id(0)*5)+1] = (uint4)(E.s0,A.s1,B.s1,C.s1);
dst[(get_global_id(0)*5)+2] = (uint4)(D.s1,E.s1,A.s2,B.s2);
dst[(get_global_id(0)*5)+3] = (uint4)(C.s2,D.s2,E.s2,A.s3);
dst[(get_global_id(0)*5)+4] = (uint4)(B.s3,C.s3,D.s3,E.s3);


}


#else



__kernel void __attribute__((reqd_work_group_size(128, 1, 1)))
sha1_saltpass_short( __global uint4 *dst, uint4 input, uint size,  uint8 chbase,  __global uint *found_ind, uint16 salt, __global uint *found, __global  uint *table,  uint4 singlehash) 
{  


uint SIZE;  
uint i,ib,ic,id,ie;  
uint t1,t2,t3;
uint A,B,C,D,E,K;
uint tmp1, l,tmp2,chbase1; 
uint w0,w1,w2,w3; 
uint w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w16,temp; 
uint w[16];
#define m 0x00FF00FF
#define m2 0xFF00FF00 

uint K0 = (uint)0x5A827999;
uint K1 = (uint)0x6ED9EBA1;
uint K2 = (uint)0x8F1BBCDC;
uint K3 = (uint)0xCA62C1D6;

uint H0 = (uint)0x67452301;
uint H1 = (uint)0xEFCDAB89;
uint H2 = (uint)0x98BADCFE;
uint H3 = (uint)0x10325476;
uint H4 = (uint)0xC3D2E1F0;
#define S1 1
#define S2 5
#define S3 30  
#define Sl 8
#define Sr 24  

chbase1=(uint)(chbase.s0);

SIZE = (uint)salt.sF; 

i = table[get_global_id(0)];
ib=i&255;
ic=(i>>8)&255;
id=(i>>16)&255;
ie=(i>>24)&255;


w[0] = (uint)salt.s0;
w[1] = (uint)salt.s1;
w[2] = (uint)salt.s2;
w[3] = (uint)salt.s3;
w[4] = (uint)salt.s4;
w[5] = (uint)salt.s5;
w[6] = (uint)salt.s6;
w[7] = (uint)salt.s7;
w[8] = (uint)salt.s8;
w[9] = (uint)salt.s9;
w[10] = (uint)salt.sA;


w[salt.sE>>2] |= (uint)ib<<((salt.sE&3)<<3);
w[(salt.sE+1)>>2] |= (uint)ic<<(((salt.sE+1)&3)<<3);
w[(salt.sE+2)>>2] |= (uint)id<<(((salt.sE+2)&3)<<3);
w[(salt.sE+3)>>2] |= (uint)ie<<(((salt.sE+3)&3)<<3);
w[(salt.sE+4)>>2] |= chbase1<<(((salt.sE+4)&3)<<3);

w0=w[0];
w1=w[1];
w2=w[2];
w3=w[3];
w4=w[4];
w5=w[5];
w6=w[6];
w7=w[7];
w8=w[8];
w9=w[9];
w10=w[10];
w11=w12=w13=w14=w16=0;

A=H0;  
B=H1;  
C=H2;  
D=H3;  
E=H4;  


#define F_00_19(b,c,d)  ((((c) ^ (d)) & (b)) ^ (d))
#define F_20_39(b,c,d)  ((c) ^ (b) ^ (d))  
#define F_40_59(b,c,d)  (((b) & (c)) | (((b)|(c)) & (d)))  
#define F_60_79(b,c,d)  F_20_39(b,c,d) 


#define Endian_Reverse32(a) { l=(a);tmp1=ROTATE(l,Sl);tmp2=ROTATE(l,Sr); (a)=(tmp1 & m)|(tmp2 & m2); } 
#define ROTATE1(a, b, c, d, e, x) e = e + ROTATE(a,S2) + F_00_19(b,c,d) + x; e = e + K; b = ROTATE(b,S3) 
#define ROTATE1_NULL(a, b, c, d, e)  e = e + ROTATE(a,S2) + F_00_19(b,c,d) + K; b = ROTATE(b,S3)
#define ROTATE2_F(a, b, c, d, e, x) e = e + ROTATE(a,S2) + F_20_39(b,c,d) + x + K; b = ROTATE(b,S3) 
#define ROTATE3_F(a, b, c, d, e, x) e = e + ROTATE(a,S2) + F_40_59(b,c,d) + x + K; b = ROTATE(b,S3)
#define ROTATE4_F(a, b, c, d, e, x) e = e + ROTATE(a,S2) + F_60_79(b,c,d) + x + K; b = ROTATE(b,S3)



K = K0;
Endian_Reverse32(w0);  
ROTATE1(A, B, C, D, E, w0);
Endian_Reverse32(w1);  
ROTATE1(E, A, B, C, D, w1);
Endian_Reverse32(w2);  
ROTATE1(D, E, A, B, C, w2);
Endian_Reverse32(w3);  
ROTATE1(C, D, E, A, B, w3);
Endian_Reverse32(w4);  
ROTATE1(B, C, D, E, A, w4);
Endian_Reverse32(w5);  
ROTATE1(A, B, C, D, E, w5);
Endian_Reverse32(w6);  
ROTATE1(E, A, B, C, D, w6);
Endian_Reverse32(w7);  
ROTATE1(D, E, A, B, C, w7);
ROTATE1_NULL(C, D, E, A, B);
ROTATE1_NULL(B, C, D, E, A);
ROTATE1_NULL(A, B, C, D, E);
ROTATE1_NULL(E, A, B, C, D);
ROTATE1_NULL(D, E, A, B, C);
ROTATE1_NULL(C, D, E, A, B);
ROTATE1_NULL(B, C, D, E, A);

ROTATE1(A, B, C, D, E, SIZE);  

w16 = ROTATE((w13 ^ w8 ^ w2 ^ w0),S1);ROTATE1(E,A,B,C,D,w16);
w0 = ROTATE((w14 ^ w9 ^ w3 ^ w1),S1);ROTATE1(D,E,A,B,C,w0); 
w1 = ROTATE((SIZE ^ w10 ^ w4 ^ w2),S1); ROTATE1(C,D,E,A,B,w1); 
w2 = ROTATE((w16 ^ w11 ^ w5 ^ w3),S1);  ROTATE1(B,C,D,E,A,w2); 


K = K1;

w3 = ROTATE((w0 ^ w12 ^ w6 ^ w4),S1); ROTATE2_F(A, B, C, D, E, w3);
w4 = ROTATE((w1 ^ w13 ^ w7 ^ w5),S1); ROTATE2_F(E, A, B, C, D, w4);
w5 = ROTATE((w2 ^ w14 ^ w8 ^ w6),S1); ROTATE2_F(D, E, A, B, C, w5);
w6 = ROTATE((w3 ^ SIZE ^ w9 ^ w7),S1);ROTATE2_F(C, D, E, A, B, w6);
w7 = ROTATE((w4 ^ w16 ^ w10 ^ w8),S1); ROTATE2_F(B, C, D, E, A, w7);
w8 = ROTATE((w5 ^ w0 ^ w11 ^ w9),S1); ROTATE2_F(A, B, C, D, E, w8);
w9 = ROTATE((w6 ^ w1 ^ w12 ^ w10),S1); ROTATE2_F(E, A, B, C, D, w9);
w10 = ROTATE((w7 ^ w2 ^ w13 ^ w11),S1); ROTATE2_F(D, E, A, B, C, w10); 
w11 = ROTATE((w8 ^ w3 ^ w14 ^ w12),S1); ROTATE2_F(C, D, E, A, B, w11); 
w12 = ROTATE((w9 ^ w4 ^ SIZE ^ w13),S1); ROTATE2_F(B, C, D, E, A, w12);
w13 = ROTATE((w10 ^ w5 ^ w16 ^ w14),S1); ROTATE2_F(A, B, C, D, E, w13);
w14 = ROTATE((w11 ^ w6 ^ w0 ^ SIZE),S1); ROTATE2_F(E, A, B, C, D, w14);
SIZE = ROTATE((w12 ^ w7 ^ w1 ^ w16),S1); ROTATE2_F(D, E, A, B, C, SIZE);
w16 = ROTATE((w13 ^ w8 ^ w2 ^ w0),S1); ROTATE2_F(C, D, E, A, B, w16);  
w0 = ROTATE(w14 ^ w9 ^ w3 ^ w1,S1); ROTATE2_F(B, C, D, E, A, w0);  
w1 = ROTATE(SIZE ^ w10 ^ w4 ^ w2,S1); ROTATE2_F(A, B, C, D, E, w1);
w2 = ROTATE(w16 ^ w11 ^ w5 ^ w3,S1); ROTATE2_F(E, A, B, C, D, w2); 
w3 = ROTATE(w0 ^ w12 ^ w6 ^ w4,S1); ROTATE2_F(D, E, A, B, C, w3);  
w4 = ROTATE(w1 ^ w13 ^ w7 ^ w5,S1);ROTATE2_F(C, D, E, A, B, w4);
w5 = ROTATE(w2 ^ w14 ^ w8 ^ w6,S1); ROTATE2_F(B, C, D, E, A, w5);  
K = K2;

w6 = ROTATE(w3 ^ SIZE ^ w9 ^ w7, S1); ROTATE3_F(A, B, C, D, E, w6);
w7 = ROTATE(w4 ^ w16 ^ w10 ^ w8, S1); ROTATE3_F(E, A, B, C, D, w7);
w8 = ROTATE(w5 ^ w0 ^ w11 ^ w9, S1); ROTATE3_F(D, E, A, B, C, w8); 
w9 = ROTATE(w6 ^ w1 ^ w12 ^ w10, S1); ROTATE3_F(C, D, E, A, B, w9);
w10 = ROTATE(w7 ^ w2 ^ w13 ^ w11, S1); ROTATE3_F(B, C, D, E, A, w10);  
w11 = ROTATE(w8 ^ w3 ^ w14 ^ w12, S1); ROTATE3_F(A, B, C, D, E, w11);  
w12 = ROTATE(w9 ^ w4 ^ SIZE ^ w13, S1); ROTATE3_F(E, A, B, C, D, w12); 
w13 = ROTATE(w10 ^ w5 ^ w16 ^ w14, S1); ROTATE3_F(D, E, A, B, C, w13); 
w14 = ROTATE(w11 ^ w6 ^ w0 ^ SIZE, S1); ROTATE3_F(C, D, E, A, B, w14); 
SIZE = ROTATE(w12 ^ w7 ^ w1 ^ w16, S1); ROTATE3_F(B, C, D, E, A, SIZE);
w16 = ROTATE(w13 ^ w8 ^ w2 ^ w0, S1); ROTATE3_F(A, B, C, D, E, w16);
w0 = ROTATE(w14 ^ w9 ^ w3 ^ w1, S1); ROTATE3_F(E, A, B, C, D, w0); 
w1 = ROTATE(SIZE ^ w10 ^ w4 ^ w2, S1); ROTATE3_F(D, E, A, B, C, w1);
w2 = ROTATE(w16 ^ w11 ^ w5 ^ w3, S1); ROTATE3_F(C, D, E, A, B, w2);
w3 = ROTATE(w0 ^ w12 ^ w6 ^ w4, S1); ROTATE3_F(B, C, D, E, A, w3); 
w4 = ROTATE(w1 ^ w13 ^ w7 ^ w5, S1); ROTATE3_F(A, B, C, D, E, w4); 
w5 = ROTATE(w2 ^ w14 ^ w8 ^ w6, S1); ROTATE3_F(E, A, B, C, D, w5); 
w6 = ROTATE(w3 ^ SIZE ^ w9 ^ w7, S1); ROTATE3_F(D, E, A, B, C, w6);
w7 = ROTATE(w4 ^ w16 ^ w10 ^ w8, S1); ROTATE3_F(C, D, E, A, B, w7);
w8 = ROTATE(w5 ^ w0 ^ w11 ^ w9, S1); ROTATE3_F(B, C, D, E, A, w8); 


K = K3;

w9 = ROTATE(w6 ^ w1 ^ w12 ^ w10, S1); ROTATE4_F(A, B, C, D, E, w9);
w10 = ROTATE(w7 ^ w2 ^ w13 ^ w11, S1); ROTATE4_F(E, A, B, C, D, w10);  
w11 = ROTATE(w8 ^ w3 ^ w14 ^ w12, S1); ROTATE4_F(D, E, A, B, C, w11);  
w12 = ROTATE(w9 ^ w4 ^ SIZE ^ w13, S1); ROTATE4_F(C, D, E, A, B, w12); 
w13 = ROTATE(w10 ^ w5 ^ w16 ^ w14, S1); ROTATE4_F(B, C, D, E, A, w13); 
w14 = ROTATE(w11 ^ w6 ^ w0 ^ SIZE, S1); ROTATE4_F(A, B, C, D, E, w14); 
SIZE = ROTATE(w12 ^ w7 ^ w1 ^ w16, S1); ROTATE4_F(E, A, B, C, D, SIZE);
w16 = ROTATE(w13 ^ w8 ^ w2 ^ w0, S1); ROTATE4_F(D, E, A, B, C, w16);
w0 = ROTATE(w14 ^ w9 ^ w3 ^ w1, S1); ROTATE4_F(C, D, E, A, B, w0); 
w1 = ROTATE(SIZE ^ w10 ^ w4 ^ w2, S1); ROTATE4_F(B, C, D, E, A, w1);
w2 = ROTATE(w16 ^ w11 ^ w5 ^ w3,S1); ROTATE4_F(A, B, C, D, E, w2); 
w3 = ROTATE(w0 ^ w12 ^ w6 ^ w4,S1); ROTATE4_F(E, A, B, C, D, w3);  
w4 = ROTATE(w1 ^ w13 ^ w7 ^ w5,S1); ROTATE4_F(D, E, A, B, C, w4);  
w5 = ROTATE(w2 ^ w14 ^ w8 ^ w6,S1); ROTATE4_F(C, D, E, A, B, w5);  
w6 = ROTATE(w3 ^ SIZE ^ w9 ^ w7,S1); ROTATE4_F(B, C, D, E, A, w6); 
w7 = ROTATE(w4 ^ w16 ^ w10 ^ w8,S1); ROTATE4_F(A, B, C, D, E, w7); 
#ifdef SINGLE_MODE
//if (((uint)singlehash.y != E)) return;
#endif
w8 = ROTATE(w5 ^ w0 ^ w11 ^ w9,S1); ROTATE4_F(E, A, B, C, D, w8);  
w9 = ROTATE(w6 ^ w1 ^ w12 ^ w10,S1); ROTATE4_F(D, E, A, B, C, w9); 
w10 = ROTATE(w7 ^ w2 ^ w13 ^ w11,S1); ROTATE4_F(C, D, E, A, B, w10);
w11 = ROTATE(w8 ^ w3 ^ w14 ^ w12,S1); ROTATE4_F(B, C, D, E, A, w11);



A=A+H0;B=B+H1;C=C+H2;D=D+H3;E=E+H4;
Endian_Reverse32(A);
Endian_Reverse32(B);
Endian_Reverse32(C);
Endian_Reverse32(D);
Endian_Reverse32(E);

if (((uint)singlehash.x!=A)) return;
if (((uint)singlehash.z!=C)) return;


found[0] = 1;
found_ind[get_global_id(0)] = 1;

dst[(get_global_id(0)*5)] = (uint)(A);  
dst[(get_global_id(0)*5)+1] = (uint)(B);
dst[(get_global_id(0)*5)+2] = (uint)(C);
dst[(get_global_id(0)*5)+3] = (uint)(D);
dst[(get_global_id(0)*5)+4] = (uint)(E);


}



#endif

