CC=       	gcc
CFLAGS= 	-g -gdwarf-2 -std=gnu99 -Wall
LDFLAGS=
LIBRARIES=      libmalloc-ff.so \
		libmalloc-nf.so \
		libmalloc-bf.so \
		libmalloc-wf.so

TESTS=		test1 \
                test2 \
                test3 \
                test4 \
                bfwf \
                ffnf \
				realloc

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

all:    $(LIBRARIES) $(TESTS)

libmalloc-ff.so:     malloc.c
	$(CC) -shared -fPIC $(CFLAGS) -DFIT=0 -o $@ $< $(LDFLAGS)

libmalloc-nf.so:     malloc.c
	$(CC) -shared -fPIC $(CFLAGS) -DNEXT=0 -o $@ $< $(LDFLAGS)

libmalloc-bf.so:     malloc.c
	$(CC) -shared -fPIC $(CFLAGS) -DBEST=0 -o $@ $< $(LDFLAGS)

libmalloc-wf.so:     malloc.c
	$(CC) -shared -fPIC $(CFLAGS) -DWORST=0 -o $@ $< $(LDFLAGS)

clean:
	rm -f $(LIBRARIES) $(TESTS)

.PHONY: all clean
