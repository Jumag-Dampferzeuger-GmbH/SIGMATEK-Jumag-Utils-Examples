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
extern "C" float fMin(float f1, float f2)
{
    return (f1 < f2) ? f1 : f2;
}

/* 

Function Global __cdecl aMin
VAR_INPUT
  INPUT : ^REAL;
  SIZE : DINT; 
END_VAR
VAR_OUTPUT
  Q : REAL;
END_VAR;

*/

// calc the min value of an array of float values
extern "C" float aMin(float *f , int size)
{
    float fMin = f[0];

    for (int i = 1; i < size; i++)
    {
        if (f[i] < fMin)
            fMin = f[i];
    }
    return fMin; 
}

