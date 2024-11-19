#include <stdio.h>
#include "operations.h"

int addnums(int arg1, int arg2){

    return arg1 + arg2;
}

int subnums(int arg1, int arg2){
    return arg1 - arg2;
}

int multnums(int num1, int num2){
    return num1 * num2;
}

int divnums(int num1, int num2){
    return num1/num2;
}

int andnums(int num1, int num2){
    return num1 & num2;
}

int ornums(int num1, int num2){
    return  num1 | num2;
}

int xornums(int num1, int num2){
    return num1^ num2;
}

int lshiftnums(int num1, int num2){
    return num1 << num2;
}

unsigned int rshiftnums(unsigned int num1, int num2){
    return num1 >> num2;
}