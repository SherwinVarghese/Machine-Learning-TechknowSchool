def fibList(arr):
    res = []
    for val in arr:
        res.append(fib(val))
    return res
    
#fibonacci series
def fib(num):
    f1 = 1
    f2 = 1 
    
    if num > 2:
        return (fib(num-1) + fib(num-2))
    else:
        return 1 

#gcd of two elements
def gcd(a, b):
    if b == 0:
        return a 
    else:
        return gcd(b, a%b)
        

def gcdList(arr):
    res = arr[0]
    for i in arr[1:]:
        res = gcd(res, i)
    return res

#reading input
try:
    initial = input().split(' ')

    if len(initial) == 2:
        A = int(initial[0])
        Q = int(initial[1])

        arrList = input().split(' ')
        if len(arrList) == A:
        
            #print arrList
            queries = []
            for i in range(int(Q)):
                i = input().split(' ')
                queries.append(i)

            resultList = []    
            for query in queries:
                newList = arrList[int(query[0]) - 1 : int(query[1]) - 1 ]
                newList = list(map(int, newList))
                fibResultList = fibList(newList)
                GcdResultList = gcdList(fibResultList)
                resultList.append(GcdResultList)

            print(resultList)
            #return resultList
except IOError:
    print('An error occured trying to read the file.')

