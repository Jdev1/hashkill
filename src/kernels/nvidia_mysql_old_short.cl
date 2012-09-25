#define ROTATE(a,b) ((a) << (b)) + ((a) >> (32-(b)))


#ifdef SM21

void mysql_old_short1( __global uint4 *dst, uint4 input, uint size,  uint4 chbase,  __global uint *found_ind, __global uint *bitmaps, __global uint *found, uint i,  uint4 singlehash, uint factor) 
{  

#define nr 1345345333
#define add 7
#define nr2 0x12345671
#define Sl 8
#define Sr 24
#define m 0x00FF00FF
#define m2 0xFF00FF00
#define Endian_Reverse32(a) { l=(a);tmp1=ROTATE(l,Sl);tmp2=ROTATE(l,Sr); (a)=(tmp1 & m)|(tmp2 & m2); } 

uint4 l;  
uint ib,ic,id,ie,b1,b2,b3;  
uint4 a,b,c,d, tmp,tmp1,tmp2,A,B; 


ib = (uint)i&255;  
ic = (uint)((i>>8)&255);
id = (uint)((i>>16)&255);  
ie = (uint)((i>>24)&255);

if (size==1)
{
a = (uint4)nr;
b = (uint4)nr2;
c = (uint4)add;
tmp = chbase;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = ib;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = ic;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = id;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = ie;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
A=a & ((1 << 31) - 1);
B=b & ((1 << 31) -1);
Endian_Reverse32(A);
Endian_Reverse32(B);
}

else if (size==2)
{
a = (uint4)nr;
b = (uint4)nr2;
c = (uint4)add;

tmp = input.x&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = chbase;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = ib;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = ic;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = id;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = ie;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
A=a & ((1 << 31) - 1);
B=b & ((1 << 31) -1);
Endian_Reverse32(A);
Endian_Reverse32(B);
}

else if (size==3)
{
a = (uint4)nr;
b = (uint4)nr2;
c = (uint4)add;

tmp = (input.x)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.x>>8)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = chbase;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = ib;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = ic;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = id;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = ie;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
A=a & ((1 << 31) - 1);
B=b & ((1 << 31) -1);
Endian_Reverse32(A);
Endian_Reverse32(B);
}

else if (size==4)
{
a = (uint4)nr;
b = (uint4)nr2;
c = (uint4)add;

tmp = (input.x)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.x>>8)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.x>>16)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = chbase;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = ib;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = ic;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = id;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = ie;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;

A=a & ((1 << 31) - 1);
B=b & ((1 << 31) -1);
Endian_Reverse32(A);
Endian_Reverse32(B);
}

else if (size==5)
{
a = (uint4)nr;
b = (uint4)nr2;
c = (uint4)add;

tmp = (input.x)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.x>>8)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.x>>16)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.x>>24)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = chbase;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = ib;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = ic;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = id;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = ie;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;

A=a & ((1 << 31) - 1);
B=b & ((1 << 31) -1);
Endian_Reverse32(A);
Endian_Reverse32(B);
}

else if (size==6)
{
a = (uint4)nr;
b = (uint4)nr2;
c = (uint4)add;

tmp = (input.y)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.x)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.x>>8)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.x>>16)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.x>>24)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = chbase;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = ib;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = ic;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = id;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = ie;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;

A=a & ((1 << 31) - 1);
B=b & ((1 << 31) -1);
Endian_Reverse32(A);
Endian_Reverse32(B);
}

else if (size==7)
{
a = (uint4)nr;
b = (uint4)nr2;
c = (uint4)add;

tmp = (input.y)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.y>>8)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.x)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.x>>8)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.x>>16)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.x>>24)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = chbase;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = ib;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = ic;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = id;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = ie;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;

A=a & ((1 << 31) - 1);
B=b & ((1 << 31) -1);
Endian_Reverse32(A);
Endian_Reverse32(B);
}

else if (size==8)
{
a = (uint4)nr;
b = (uint4)nr2;
c = (uint4)add;

tmp = (input.y)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.y>>8)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.y>>16)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.x)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.x>>8)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.x>>16)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.x>>24)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = chbase;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = ib;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = ic;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = id;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = ie;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;

A=a & ((1 << 31) - 1);
B=b & ((1 << 31) -1);
Endian_Reverse32(A);
Endian_Reverse32(B);
}

else if (size==9)
{
a = (uint4)nr;
b = (uint4)nr2;
c = (uint4)add;

tmp = (input.y)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.y>>8)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.y>>16)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.y>>24)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.x)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.x>>8)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.x>>16)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.x>>24)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = chbase;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = ib;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = ic;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = id;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = ie;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;

A=a & ((1 << 31) - 1);
B=b & ((1 << 31) -1);
Endian_Reverse32(A);
Endian_Reverse32(B);
}

else if (size==10)
{
a = (uint4)nr;
b = (uint4)nr2;
c = (uint4)add;

tmp = (input.z)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.y)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.y>>8)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.y>>16)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.y>>24)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.x)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.x>>8)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.x>>16)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.x>>24)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = chbase;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = ib;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = ic;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = id;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = ie;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;

A=a & ((1 << 31) - 1);
B=b & ((1 << 31) -1);
Endian_Reverse32(A);
Endian_Reverse32(B);
}

else if (size==11)
{
a = (uint4)nr;
b = (uint4)nr2;
c = (uint4)add;


tmp = (input.z)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.z>>8)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.y)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.y>>8)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.y>>16)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.y>>24)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.x)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.x>>8)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.x>>16)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.x>>24)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = chbase;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = ib;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = ic;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = id;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = ie;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;

A=a & ((1 << 31) - 1);
B=b & ((1 << 31) -1);
Endian_Reverse32(A);
Endian_Reverse32(B);
}



#ifdef SINGLE_MODE
id = 0;
if ((singlehash.x==A.s0)&&(singlehash.y==B.s0)) id=1;
if ((singlehash.x==A.s1)&&(singlehash.y==B.s1)) id=1;
if ((singlehash.x==A.s2)&&(singlehash.y==B.s2)) id=1;
if ((singlehash.x==A.s3)&&(singlehash.y==B.s3)) id=1;

if (id==0) return;
#endif



#ifndef SINGLE_MODE

id = 0;
b1=A.s0;b2=B.s0;
b3=(singlehash.x >> (B.s0&31))&1;
if (b3) if ( ((bitmaps[b1>>13]>>(b1&31))&1) && ((bitmaps[65535*8+(b2>>13)]>>(b2&31))&1) ) id=1;
b1=A.s1;b2=B.s1;
b3=(singlehash.x >> (B.s1&31))&1;
if (b3) if ( ((bitmaps[b1>>13]>>(b1&31))&1) && ((bitmaps[65535*8+(b2>>13)]>>(b2&31))&1) ) id=1;
b1=A.s2;b2=B.s2;
b3=(singlehash.x >> (B.s2&31))&1;
if (b3) if ( ((bitmaps[b1>>13]>>(b1&31))&1) && ((bitmaps[65535*8+(b2>>13)]>>(b2&31))&1) ) id=1;
b1=A.s3;b2=B.s3;
b3=(singlehash.x >> (B.s3&31))&1;
if (b3) if ( ((bitmaps[b1>>13]>>(b1&31))&1) && ((bitmaps[65535*8+(b2>>13)]>>(b2&31))&1) ) id=1;

if (id==0) return;
#endif

if (id==1) 
{
found[0] = 1;
found_ind[get_global_id(0)] = 1;
}


#ifdef DOUBLE
dst[(get_global_id(0)<<2)+factor] = (uint4)(A.s0,B.s0,A.s1,B.s1);
dst[(get_global_id(0)<<2)+1+factor] = (uint4)(A.s2,B.s2,A.s3,B.s3);
#else
dst[(get_global_id(0)<<1)] = (uint4)(A.s0,B.s0,A.s1,B.s1);
dst[(get_global_id(0)<<1)+1] = (uint4)(A.s2,B.s2,A.s3,B.s3);
#endif

}

__kernel void __attribute__((reqd_work_group_size(128, 1, 1))) 
mysql_old_short( __global uint4 *dst, uint4 input, uint size,  uint16 chbase,  __global uint *found_ind, __global uint *bitmaps, __global uint *found, __global  uint *table,  uint4 singlehash) 
{
uint i;
uint4 chbase1;
i = table[get_global_id(0)];
chbase1 = (uint4)(chbase.s0,chbase.s1,chbase.s2,chbase.s3);
mysql_old_short1(dst,input, size, chbase1, found_ind, bitmaps, found, i, singlehash,0);
#ifdef DOUBLE
chbase1 = (uint4)(chbase.s4,chbase.s5,chbase.s6,chbase.s7);
mysql_old_short1(dst,input, size, chbase1, found_ind, bitmaps, found, i, singlehash,2);
#endif
}



#else

__kernel void __attribute__((reqd_work_group_size(128, 1, 1))) 
mysql_old_short( __global uint2 *dst, uint4 input, uint size,  uint16 chbase,  __global uint *found_ind, __global uint *bitmaps, __global uint *found, __global  uint *table,  uint4 singlehash) 
{  

#define nr 1345345333
#define add 7
#define nr2 0x12345671
#define Sl 8
#define Sr 24
#define m 0x00FF00FF
#define m2 0xFF00FF00
#define Endian_Reverse32(a) { l=(a);tmp1=ROTATE(l,Sl);tmp2=ROTATE(l,Sr); (a)=(tmp1 & m)|(tmp2 & m2); } 

uint l, chbase1;  
uint i,ib,ic,id,ie,b1,b2,b3;  
uint a,b,c,d, tmp,tmp1,tmp2,A,B; 

chbase1=(uint)(chbase.s0);

i = table[get_global_id(0)];
ib = (uint)i&255;  
ic = (uint)((i>>8)&255);
id = (uint)((i>>16)&255);  
ie = (uint)((i>>24)&255);

if (size==1)
{
a = (uint)nr;
b = (uint)nr2;
c = (uint)add;
tmp = chbase1;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = ib;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = ic;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = id;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = ie;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
A=a & ((1 << 31) - 1);
B=b & ((1 << 31) -1);
Endian_Reverse32(A);
Endian_Reverse32(B);
}

else if (size==2)
{
a = (uint)nr;
b = (uint)nr2;
c = (uint)add;

tmp = input.x&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = chbase1;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = ib;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = ic;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = id;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = ie;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
A=a & ((1 << 31) - 1);
B=b & ((1 << 31) -1);
Endian_Reverse32(A);
Endian_Reverse32(B);
}

else if (size==3)
{
a = (uint)nr;
b = (uint)nr2;
c = (uint)add;

tmp = (input.x)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.x>>8)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = chbase1;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = ib;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = ic;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = id;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = ie;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
A=a & ((1 << 31) - 1);
B=b & ((1 << 31) -1);
Endian_Reverse32(A);
Endian_Reverse32(B);
}

else if (size==4)
{
a = (uint)nr;
b = (uint)nr2;
c = (uint)add;

tmp = (input.x)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.x>>8)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.x>>16)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = chbase1;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = ib;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = ic;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = id;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = ie;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;

A=a & ((1 << 31) - 1);
B=b & ((1 << 31) -1);
Endian_Reverse32(A);
Endian_Reverse32(B);
}

else if (size==5)
{
a = (uint)nr;
b = (uint)nr2;
c = (uint)add;

tmp = (input.x)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.x>>8)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.x>>16)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.x>>24)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = chbase1;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = ib;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = ic;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = id;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = ie;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;

A=a & ((1 << 31) - 1);
B=b & ((1 << 31) -1);
Endian_Reverse32(A);
Endian_Reverse32(B);
}

else if (size==6)
{
a = (uint)nr;
b = (uint)nr2;
c = (uint)add;

tmp = (input.y)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.x)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.x>>8)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.x>>16)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.x>>24)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = chbase1;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = ib;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = ic;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = id;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = ie;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;

A=a & ((1 << 31) - 1);
B=b & ((1 << 31) -1);
Endian_Reverse32(A);
Endian_Reverse32(B);
}

else if (size==7)
{
a = (uint)nr;
b = (uint)nr2;
c = (uint)add;

tmp = (input.y)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.y>>8)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.x)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.x>>8)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.x>>16)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.x>>24)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = chbase1;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = ib;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = ic;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = id;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = ie;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;

A=a & ((1 << 31) - 1);
B=b & ((1 << 31) -1);
Endian_Reverse32(A);
Endian_Reverse32(B);
}

else if (size==8)
{
a = (uint)nr;
b = (uint)nr2;
c = (uint)add;

tmp = (input.y)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.y>>8)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.y>>16)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.x)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.x>>8)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.x>>16)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.x>>24)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = chbase1;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = ib;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = ic;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = id;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = ie;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;

A=a & ((1 << 31) - 1);
B=b & ((1 << 31) -1);
Endian_Reverse32(A);
Endian_Reverse32(B);
}

else if (size==9)
{
a = (uint)nr;
b = (uint)nr2;
c = (uint)add;

tmp = (input.y)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.y>>8)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.y>>16)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.y>>24)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.x)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.x>>8)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.x>>16)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.x>>24)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = chbase1;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = ib;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = ic;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = id;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = ie;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;

A=a & ((1 << 31) - 1);
B=b & ((1 << 31) -1);
Endian_Reverse32(A);
Endian_Reverse32(B);
}

else if (size==10)
{
a = (uint)nr;
b = (uint)nr2;
c = (uint)add;

tmp = (input.z)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.y)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.y>>8)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.y>>16)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.y>>24)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.x)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.x>>8)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.x>>16)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.x>>24)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = chbase1;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = ib;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = ic;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = id;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = ie;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;

A=a & ((1 << 31) - 1);
B=b & ((1 << 31) -1);
Endian_Reverse32(A);
Endian_Reverse32(B);
}

else if (size==11)
{
a = (uint)nr;
b = (uint)nr2;
c = (uint)add;


tmp = (input.z)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.z>>8)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.y)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.y>>8)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.y>>16)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.y>>24)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.x)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.x>>8)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.x>>16)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = (input.x>>24)&255;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = chbase1;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = ib;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = ic;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = id;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;
tmp = ie;
a = a ^ (mad24(((a & 63) + c), tmp,  (a << 8)));
b += (b << 8) ^ a;
c += tmp;

A=a & ((1 << 31) - 1);
B=b & ((1 << 31) -1);
Endian_Reverse32(A);
Endian_Reverse32(B);
}



#ifdef SINGLE_MODE
id = 0;
if ((singlehash.x==A)&&(singlehash.y==B)) id=1;
if (id==0) return;
#endif



#ifndef SINGLE_MODE

id = 0;
b1=A;b2=B;
b3=(singlehash.x >> (B&31))&1;
if (b3) if ( ((bitmaps[b1>>13]>>(b1&31))&1) && ((bitmaps[65535*8+(b2>>13)]>>(b2&31))&1) ) id=1;
if (id==0) return;
#endif

if (id==1) 
{
found[0] = 1;
found_ind[get_global_id(0)] = 1;
}

dst[(get_global_id(0)<<1)] = (uint2)(A,B);

}

#endif