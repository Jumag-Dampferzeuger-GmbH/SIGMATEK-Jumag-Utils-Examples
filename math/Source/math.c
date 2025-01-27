#include "cConstants.h"
/* 

Function Global __cdecl fMin
VAR_INPUT
  CMP1 : REAL;
  CMP2 : REAL; 
END_VAR
VAR_OUTPUT
  Q : REAL;
END_VAR;

*/


// calc the min value of two float values
extern "C" float fMin(const float f1, const float f2)
{
    return (f1 < f2) ? f1 : f2;
}

/* 

Function Global __cdecl aMinF
VAR_INPUT
  pINPUT : ^REAL;
  SIZE : DINT; 
END_VAR
VAR_OUTPUT
  Q : REAL;
END_VAR;

*/

// calc the min value of an array of float values
extern "C" float aMinF(const float *f , const long int size)
{
    float fMin = f[0];

    for (int i = 1; i < size; i++)
    {
        if (f[i] < fMin)
            fMin = f[i];
    }
    return fMin; 
}

/* 

Function Global __cdecl fMax
VAR_INPUT
  CMP1 : REAL;
  CMP2 : REAL; 
END_VAR
VAR_OUTPUT
  Q : REAL;
END_VAR;

*/


// calc the max value of two float values
extern "C" float fMax(const float f1, const float f2)
{
  return (f1 > f2) ? f1 : f2;
}

/* 

Function Global __cdecl aMaxF
VAR_INPUT
  pINPUT : ^REAL;
  SIZE : DINT; 
END_VAR
VAR_OUTPUT
  Q : REAL;
END_VAR;

*/

// calc the max value of an array of float values
extern "C" float aMaxF(const float *f , const int size)
{
    float fMax = f[0];

    for (int i = 1; i < size; i++)
    {
        if (f[i] > fMax)
            fMax = f[i];
    }
    return fMax; 
}

/* 

Function Global __cdecl aMinF
VAR_INPUT
  pINPUT : ^DINT;
  SIZE : DINT; 
END_VAR
VAR_OUTPUT
  Q : DINT;
END_VAR;

*/

// calc the min value of an array of DINTs
extern "C" long int aMin(const long int *input , const long int size)
{
    long int minValue = input[0];

    for (int i = 1; i < size; i++)
    {
        if (input[i] < minValue)
            minValue = input[i];
    }
    return minValue; 
}



/* 

Function Global __cdecl isFinite
VAR_INPUT
  INPUT : REAL; 
END_VAR
VAR_OUTPUT
  Q : BOOL;
END_VAR;

*/ 
// true (1) if f is finite.
extern "C" bool isFinite(const float f)
{
    return (f <= FLOAT_MAXVAL && f >= -FLOAT_MAXVAL) ? true : false;
}

/* 

Function Global __cdecl isGreater
VAR_INPUT
  CMP1 : REAL;
  CMP2 : REAL; 
END_VAR
VAR_OUTPUT
  Q : BOOL;
END_VAR;

*/
// true (1) if f1 is greater than f2.
extern "C" bool isGreater(const float f1, const float f2)
{
    return (f1 > f2) ? true : false;
}

/* 

Function Global __cdecl isGreaterEqual
VAR_INPUT
  CMP1 : REAL;
  CMP2 : REAL; 
END_VAR
VAR_OUTPUT
  Q : BOOL;
END_VAR;

*/
// true (1) if f1 is greater equal than f2.
extern "C" bool isGreaterEqual(const float f1, const float f2)
{
    return (f1 >= f2) ? true : false;
}


/* 

Function Global __cdecl truncate
VAR_INPUT
  INPUT : DINT;
  BASE : DINT;
  DIGITS : DINT; 
END_VAR
VAR_OUTPUT
  Q : DINT;
END_VAR;

*/
extern "C" long int truncate(const long int value, long int base, const long int decimalPoint)
{
  char maxSize = 8;

  if (decimalPoint < 0)
    return -1;
  
  if (decimalPoint > maxSize)
    return -2;

  long int div = 1; 

   for (int i = 0; i < decimalPoint; i++)
    div *= 10;

   
   long int moduloFactor = 1; 
   long int temp_value = value / base;
   for (int i = 0; i < maxSize; i++)
   {
     moduloFactor *= 10;
     if(temp_value % moduloFactor == temp_value)
     {
        moduloFactor /= 10;
        base = moduloFactor;
       break;
     }
   }
  long int upperPart = value / base;
  long int lowerPart = value % base ;

  lowerPart = div > base ? base : lowerPart / (base / div);

   long int ret = (upperPart * div) + lowerPart;
  return ret;
}

/* 

Function Global __cdecl truncateF
VAR_INPUT
  INPUT : REAL;
  DIGITS : DINT; 
END_VAR
VAR_OUTPUT
  Q : REAL;
END_VAR;

*/

extern "C" float truncateF(const float value, const long int digits)
{
    float scale = 1;

    for (long int i = 0; i < digits; i++)
    {
        scale *= 10;
    }
    return (((long long)value * scale)) / scale;
}







