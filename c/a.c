#include <stdio.h>
#include <string.h>
#include <stdlib.h>

void xstrcpy(char *s, char *t);

int main()
{
    char amessage[] = "hello world!\n";
    //printf("sizeof %lu", malloc(sizeof(char[10])));
    //char * bmessage = malloc(sizeof *amessage);
    char *bmessage =  "1234567890123";
    printf("amessage %s\n", amessage);
    printf("bmessage %s\n", bmessage);
    printf("amessage length %lu\n", strlen(amessage));
    printf("bmessage length %lu\n", strlen(bmessage));
    printf("amessage sizeof %zu\n", sizeof(amessage));
    printf("bmessage sizeof %zu\n", sizeof(*bmessage));
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
    int i = 0;
        printf("s[%d], char=%c, pointer %p\n", i, s[i], &s[i]);
        printf("t[%d], char=%c, pointer %p\n", i, t[i], &t[i]);
        *s = *t;
    while ((*s = *t) != '\0')
    {
        printf("s[%d], char=%c, pointer %p\n", i, s[i], &s[i]);
        printf("t[%d], char=%c, pointer %p\n", i, t[i], &t[i]);
        s++;
        t++;
        i++;
    }
}
