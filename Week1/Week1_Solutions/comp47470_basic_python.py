
# Problem 1
print('Hello, World!')

# Problem 2
def gcd(a, b):
    if (a == 0):
        return b

    if (b == 0):
        return a

    if (a > b):
        return gcd(a-b, b)
    
    return gcd(a, b-a)
    
print("GCD of 6 and 12 is {0}.".format(gcd(6,12)))
print("GCD of 22 and 220 is %d." % gcd(22,220))

# Problem 3
import operator
from functools import reduce

sum1to100 = reduce(operator.add, [i for i in range(1,101) ], 0)
print("Sum of numbers from 1 to 100 is {0}.".format(sum1to100))

# Problem 4
def dotp(a, b):
    return sum(x*y for x, y in zip(a, b))

a = [x for x in range(1,11)]
b = [y for y in range(20,30)]
print("Dot product of two lists a, b is {0}".format(dotp(a,b)))

# Problem 5
list1to100 = [i for i in range(1,101) ]
print("Sum of squares 1 to 100: {0}".format(sum(x*y for x, y in zip(list1to100, list1to100))))

# Problem 6
def bsearch(haystack, start, end, needle):
    if end >= start:
        middle = start + (end - start ) // 2
        if haystack[middle] == needle:
            return middle
        elif haystack[middle] > needle:
            return bsearch(haystack, 0, middle-1, needle)
        else:
            return bsearch(haystack, middle+1, end, needle)
    else:
        return -1

def find(haystack, needle):
    pos = bsearch(haystack, 0, len(haystack)-1, needle)
    if (pos == -1):
        print("Needle {0} not found in haystack.".format(needle))
    else:
        print("Needle {0} found in haystack at position {1}.".format(needle, pos))

# Problem 7
import random
from random import randint

randlist = random.sample(range(1,1000), 100)
print(randlist)
[find(randlist,randint(1,1000)) for i in range(1,10)]

# Problem 8
IrishLiteraryGiants = [("Wilde","The Ballad of Reading Gaol"), ("Doyle","Paddy Clarke Ha Ha Ha"), ("Beckett","Waiting for Godot"), ("Joyce", "Ulysses"), ("Binchy", "Scarlet Feather"),("Donaghue","Room")]
ILGDict = {}
[ILGDict.update({key:value}) for key, value in IrishLiteraryGiants]
print(IrishLiteraryGiants)
# Alternate approach
ILGDict = dict(IrishLiteraryGiants)
print(IrishLiteraryGiants)

def FindWork(author, irishdictionary):
    return irishdictionary[author]

print("Work of {0} is {1}.".format("Donaghue", FindWork("Donaghue", ILGDict)))
print("Work of {0} is {1}.".format("Shakespeare", FindWork("Shakespeare", ILGDict)))
