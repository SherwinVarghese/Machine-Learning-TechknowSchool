myName = "Sundeep"

# This is a comment
if myName == "Sundeep" and \
   False:
    print("Hello Sundeep")

# User input

if False:
    name = input("Enter your name : ")
    num = int(input("Enter a number : "))
    print(type(name))

    print(num)
    print(name , str(num))


#Operators
num1 = 10
num2 = 3

print("division :", str(num1/num2))
print("double division:", str(num1//num2))


#&& -> AND

if 'is' in 'sundeep is':

    print("Yes")

b = 10

if 10 is b:
    print("Yes it is")


if b > 0 and b < 10:
    print("first")
elif b >= 10 and b < 100:
    print("second")
else:
    print("Third")


#range

for i in range(0, 10, 2):
    print(i)






    



