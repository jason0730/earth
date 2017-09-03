#include <stdio.h>
#include <string.h>
#include <stdlib.h>

void xstrcpy(char *s, char *t);

int main()
{
    char amessage[] = "hello world!\n";
    //printf("sizeof %lu", malloc(sizeof(char[10])));
    char * bmessage = malloc(sizeof(char *));
    //char *bmessage =  "1234567890123";
    printf("amessage %p\n", amessage);
    printf("bmessage %p\n", bmessage);
    printf("amessage length %lu\n", strlen(amessage));
    printf("bmessage length %lu\n", strlen(bmessage));
    printf("amessage sizeof %zu\n", sizeof(amessage));
    printf("bmessage sizeof %zu\n", sizeof(bmessage));
    xstrcpy(bmessage, amessage);
    printf("amessage %s\n", amessage);
    printf("bmessage %s\n", bmessage);
    printf("amessage length %lu\n", strlen(amessage));
    printf("bmessage length %lu\n", strlen(bmessage));
    printf("amessage sizeof %zu\n", sizeof(amessage));
    printf("bmessage sizeof %zu\n", sizeof(*bmessage));
    return 0;
}

void xstrcpy(char *s, char *t)
{
    while ((*s++ = *t++))
    {
        printf("s[%d], char=%c, pointer %p\n", s, **s, s);
        printf("t[%d], char=%c, pointer %p\n", t, *t, t);
    }
}
