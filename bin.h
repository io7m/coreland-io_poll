#ifndef BIN_H
#define BIN_H

long bin_chr(const void *, unsigned long, int);
long bin_rchr(const void *, unsigned long, int);

int bin_char(const void *, unsigned long, int, unsigned long *);
int bin_rchar(const void *, unsigned long, int, unsigned long *);

void bin_tolower(void *, unsigned long);
void bin_toupper(void *, unsigned long);

void bin_copy(const void *, void *, unsigned long);
void bin_copyr(void *, const void *, unsigned long);
void bin_zero(void *, unsigned long);
void bin_set(void *, unsigned long, int);

int bin_diff(const void *, const void *, unsigned long);
unsigned long bin_count(const void *, unsigned long, int);

#define bin_same(a,b,n) (bin_diff((a),(b),(n)) == 0)

#endif
