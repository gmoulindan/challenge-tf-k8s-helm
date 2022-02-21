import sys
import fileinput

cache = {}

def populate_cache(number, value):
    cache[number]=value


def calculate_prime(number):
    half_number=number/2
    for i in range(2, number):
        if ((number % i) == 0):
            populate_cache(number, True)
            return False
        elif (i > half_number):
            print(i)
            break
    populate_cache(number, True)
    return True

def check_prime(number):
    if number in cache.keys():
        return cache[number]
    return calculate_prime(number)
