#include <stdio.h>
#include "operations.h"

int main(){
    int num1 = 0;
    int num2 = 0;
    int oper = 0;
    int result = 0;
    int count = 0;
    char str1;

    printf("Welcome to the Calculator program.\n");
    printf("Operations - 1:add 2:subtract 3:multiply 4:divide 5:and 6:or 7:xor 8:lshift");

    do {
        count++;
        printf("\nNumber of operations performed: %d\n", count-1);
        printf("Enter number: ");
        scanf("%d", &num1);
        printf("Enter second number: ");
        scanf("%d", &num2);
        printf("Select operation: ");
        scanf("%d", &oper);

        switch (oper) {
            case 1:
                result = addnums(num1, num2);
                break;
            case 2:
                result = subnums(num1, num2);
                break;
            case 3:
                result = multnums(num1, num2);
                break;
            case 4:
                result = divnums(num1, num2);
                break;
            case 5:
                result = andnums(num1, num2);
                break;
            case 6:
                result = ornums(num1, num2);
                break;
            case 7:
                result = xornums(num1, num2);
                break;
            case 8:
                result = lshiftnums(num1, num2);
                break;
            case 9:
                result = rshiftnums(num1, num2);
                break;
            default:
                printf("Invalid Operation\n");
                continue;
        }
        printf("Result: %d\n", result);
        printf("Continue (y/n)?: ");
        scanf(" %c", &str1);

    }
    while (str1 != 'n');
    printf("Number of operations performed: %d\n", count);
    printf("Exiting\n");
    return 0;
}

