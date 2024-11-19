/******************************************************************************

                            Online C Compiler.
                Code, Compile, Run and Debug C program online.
Write your code in this editor and press "Run" button to compile and execute it.

*******************************************************************************/

#include <stdio.h>

int main() {
    printf("Welcome to the CountOnes program.\n");
    char response = 'y';
    while (response != 'n') {
        printf("Please enter a number: ");
        int input;
        int number = 0;
        int size = sizeof(int) * 8 -1;
        unsigned int mask =1 << size;
        scanf("%d", &input);
        int count = 0;
        while (number <= size) {
            if ((input & mask)  != 0){
                count++;
            }
            number ++ ;
            mask >>= 1;
        }
        printf("The number of bits set is %d\n", count);
        printf("Continue (y/n)?: ");
        scanf(" %c", &response);
        count = 0;
    }
    printf("Exiting\n");
    return 0;
}