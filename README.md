# Heap-Management
Implementation of a library that interacts with the operating system to perform heap management on behalf of a user process. This program implements malloc, calloc and realloc using 4 different heap management strategies. It also supports coalesing and splitting of blocks.

## Building and Runnning the code
The code compiles into four shared libraries and four test programs. To build the code, change to
your top level assignment directory and type: 

      make
Once you have the library, you can use it to override the existing malloc by using
LD_PRELOAD: 

      env LD_PRELOAD=libmalloc-ff.so test1 

To run the other heap management schemes replace libmalloc-ff.so with the appropriate
library:


      Best-Fit: libmalloc-bf.so
      First-Fit: libmalloc-ff.so
      Next-Fit: libmalloc-nf.so
      Worst-Fit: libmalloc-wf.so 
      
To use other tests replace test1 with the name of other test files.

