
# Problem 1
import random
lst = random.sample(range(1,100), 50)
print("List of 50 random integers {0}.".format(lst))

def is_even ( x ) :
    return ( x % 2) == 0

flst = filter(is_even, lst)
print("List of even numbers from the random list {0}".format(list(flst)))

# Problem 2
print(*(x for x in lst if is_even ( x )))

# Problem 3
genexp = (x for x in lst if is_even ( x ))
for i in genexp:
    print(i, end=" ")
print()

# Problem 4
import operator
from functools import reduce
sum1to100 = reduce(operator.add, [i for i in range(1,101) ], 0)
print("Sum of numbers from 1 to 100 is {0}.".format(sum1to100))

# Problem 5
list1to100 = [i for i in range(1,101) ]
print("Sum of squares 1 to 100: {0}".format(sum(x*y for x, y in zip(list1to100, list1to100))))

# Problem 6
def Pythagorean(xyztuple):
    x,y,z = xyztuple
    return ((x*x + y*y) == (z*z))
triplets = filter(Pythagorean, [(x, y, z) for x in range(1,11) for y in range(1,11) for z in range(1,11)])
print("List of Pythagorean triplets: {0}.".format(list(triplets)))

# Problem 7
def upper(s):
   return s.upper()
f = open("foo.txt", "r+")
g = (upper(s) for s in f)
print(''.join(g))
