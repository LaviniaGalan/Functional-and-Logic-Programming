#8a)

def gcd(a, b):
    if b==0:
        return a
    else:
        return gcd(b, a%b)


def lcm(l):
    if len(l) == 0:
        return 0
    elif len(l) == 1: 
        return l[0]
    else:
        return (l[0]*lcm(l[1:])//gcd(l[0], lcm(l[1:])))


l = []
a = lcm(l)
print(a)


#8b)

class Nod:
    def __init__(self, e):
        self.e = e
        self.urm = None
    
class Lista:
    def __init__(self):
        self.prim = None
        

'''
crearea unei liste din valori citite pana la 0
'''
def creareLista():
    lista = Lista()
    lista.prim = creareLista_rec()
    return lista

def creareLista_rec():
    x = int(input("x="))
    if x == 0:
        return None
    else:
        nod = Nod(x)
        nod.urm = creareLista_rec()
        return nod
    
'''
tiparirea elementelor unei liste
'''
def tipar(lista):
    tipar_rec(lista.prim)
    
def tipar_rec(nod):
    if nod != None:
        print (nod.e)
        tipar_rec(nod.urm)
        

'''
program pentru test
'''
        
def main():
    list = creareLista()
    tipar(list)

#-auxiliary functions
def lenght(l, elem):
    if elem == None:
        return 0
    else:
        return 1+lenght(l, elem.urm)

def getFirst(l):
    if l.prim == None:
        return None
    else:
        return l.prim.e

def addFirst(e, l):
    nod = Nod(e)
    nod.urm = l.prim
    l.prim = nod
    return l

def deleteFirst(l):
    if l.prim == None:
        return l
    else:
        l.prim = l.prim.urm
        return l

# b
def substitute(e, e1, l):
    if l.prim == None:
        return l
    elif l.prim.e == e:
        l = deleteFirst(l)
        addFirst(e1, substitute(e,e1,l))
        return l
    else:
        firstElem = l.prim.e
        l = deleteFirst(l)
        addFirst(firstElem, substitute(e,e1,l))
        return l

# l = creareLista()
# e = int(input("e="))
# e1 = int(input("e1="))
# l = substitute(e, e1, l)
# tipar(l)

# b
def insert1(e, l, m, i):
    if l.prim == None:
        return l
    elif i == m+1:
        l = deleteFirst(l)
        addFirst(e, insert(e, l, m*2, i+1))
        return l
    elif i!=m+1:
        firstElem = l.prim.e
        l = deleteFirst(l)
        addFirst(firstElem, insert(e,l,m,i+1))
        return l


def insert(e, l, m, i):
    if l.prim == None:
        return l
    elif i == m+1:
        return addFirst(e, insert(e, l, m*2, i)) #cu i+1 daca vreau sa condiser alea inserate ca fiind in lista :)
    else:
        firstElem = l.prim.e
        return addFirst(firstElem, insert(e, deleteFirst(l), m, i+1))


l = creareLista()
insert(11111, l, 1, 1)
tipar(l)