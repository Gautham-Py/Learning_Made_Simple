/* Algorithms */

'Euclids Algorithm:'  'greatest common divisor of two number'
/* p and q are nonnegative integers, r is remainder */

public static int gcd(int p, int q)
{
  if (q ==0 ) return p;
  int r = p % q;
  return gcd(q, r);
}

'Declaring, Creating and Initializing an Array'

/* initialize declaration */

int[] a = {1,1,2,35,8}

/* Short Form */
double[]a = new double [N]

/* Long Form */
double[] a;
a = new double[N];
for (int i = 0; i < N; i++)
    a[i] = 0.0; 


/* Array Processing Code */

'find the maximun of array values'

double max = a[0];
for( int i =1; i < a.length; i++)
   if (a[i] > max) max = a[i];

'average of array values'

int N = a.length;
double sum = 0.0;
for (int i =0; i < N; i++)
    sum += a[i];
double average = sum / N;

'Copy to another array'


'reverse the elements within an array'
int N = a.length;
for(int i = 0; i< N/2; i++)
{
  double temp = a[i];
  a[i] = a[N-1-i];
  a[N-1-i] = temp;
}
