#Write a program that takes 2 inputs from user ..
# first input -> num1
# second input -> num2


import math

if False:
    x = 10.5
    print(math.ceil(x))
    print(max([10,20,30]))


if False:
    str1 = input()
    str2 = "Hello"
    str3 = str1 + str2
#str3 = str2.join(str1)
    print(str3)

    for char in str1:
        print(char)
        print(ord(char))

    print(len(str1))

    str2 = "Hello"
    str3 = str2.join(str1)
    print(str3)


#print("Hello %s", %.format(str1))
if False:
    l = []
    print(l)
    l.append(10)
    l.append("Sundeep")
    print(l)

    print(l[1][0])

if False:
    
    myTuple = (1,)

    myDict = {
            'a' : 1,
            'b' : 2
        }

    print(myDict['a'])
    print(myDict.keys())

    for key in myDict.keys():
        print(key)

    for i in [1,2,3]:
        print(i)

    for key in myDict.values():
        print(key)

    for key, value in myDict.items():
        print(key)
        print(value)



#import math
#from math import ceil

#from math import *



def maximum(a,b=30):
    return a>b


print(maximum(b=10,a=20))
print(maximum(29))


#<return_value> <for_loop> <condition>]


#functions
#lists
#loops
#string

l = [' '.join(map(str, range(i))) for i in range(10)]
for i in l:
    print(i)


num = int(input("Enter a number : "))

for i in range(num):
    for j in range(i+1):
        print(j, end=" ")
    print("")



