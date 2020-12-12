import numpy as np
cimport numpy as np
cimport cython
import cython
from libc.math cimport sqrt, abs, exp, sin, cos
#cython: boundscheck=False, wraparound=False, nonecheck=False, language_level=3


REALNUMS = [int, long, float]
cdef bint boolean_variable = True

ctypedef fused realnum:
    cython.int
    cython.long
    cython.float
    cython.double


cdef class vec2:
    cdef public double x
    cdef public double y

    def __init__(self, x, y):
        self.x = x
        self.y = y

    def __str__(self):
        return '({:0.2f}, {:0.2f})'.format(self.x, self.y)

    ####################
    # BINARY OPERATORS #
    ####################

    # Addition
    def __add__(self, v):
        if type(self) in REALNUMS:
            return v.add_realnum(self)
        elif type(v) in REALNUMS:
            return self.add_realnum(v)
        elif isinstance(v, vec2):
            return self.add_vec(v)

    cpdef vec2 add_realnum(self, realnum v):
        return vec2(self.x+v, self.y+v)

    cpdef vec2 add_vec(self, vec2 v):
        return vec2(self.x+v.x, self.y+v.y)

    # Subtraction
    def __sub__(self, v):
        if type(self) in REALNUMS:
            return v.sub_realnum(self)
        elif type(v) in REALNUMS:
            return self.sub_realnum(v)
        elif isinstance(v, vec2):
            return self.sub_vec(v)

    cpdef vec2 sub_realnum(self, realnum v):
        return vec2(self.x-v, self.y-v)

    cpdef vec2 sub_vec(self, vec2 v):
        return vec2(self.x-v.x, self.y-v.y)

    # Products
    def __mul__(self, v):
        if type(self) in REALNUMS:
            return v.mul_realnum(self)
        elif type(v) in REALNUMS:
            return self.mul_realnum(v)
        elif isinstance(v, vec2):
            return self.dot_vec(v)

    cpdef vec2 mul_realnum(self, realnum v):
        return vec2(self.x*v, self.y*v)

    cpdef double dot_vec(self, vec2 v):
        return self.x*v.x + self.y*v.y
    
    # Division
    def __truediv__(self, v):
        # NOTE: returns the zero vector
        # when division by zero happend.
        if type(v) in REALNUMS:
            return self.div_realnum(v)
        elif isinstance(v, vec2):
            return self.div_vec(v)

    cpdef vec2 div_realnum(self, realnum v):
        if v == 0:
            return vec2(0, 0)
        else:
            return vec2(self.x/v, self.y/v)

    cpdef vec2 div_vec(self, vec2 v):
        if (v.x == 0) or (v.y == 0):
            return vec2(0, 0)
        else:
            return vec2(self.x/v.x, self.y/v.y)
    
    # Power
    def __pow__(self, a, b):
        return self.pow(a)

    cpdef vec2 pow(self, realnum a):
        return vec2(self.x**a, self.y**a)
   
    ########################
    # EXTENDED ASSIGNMENTS #
    ########################

    # Addition (+=)
    #def __iadd__(self, v):
    #    if type(v) in REALNUMS:
    #        return self.iadd_realnum(v)
    #    elif isinstance(v, vec2):
    #        return self.iadd_vec(v)

    #cpdef vec2 iadd_realnum(self, realnum v):
    #    return vec2(self.x+v, self.y+v)

    #cpdef vec2 iadd_vec(self, vec2 v):
    #    return vec2(self.x+v.x, self.y+v.y)
    
    # Subtraction (-=)
    #def __isub__(self, v):
    #    if type(v) in REALNUMS:
    #        return self.isub_realnum(v)
    #    elif isinstance(v, vec2):
    #        return self.isub_vec(v)

    #cpdef vec2 isub_realnum(self, realnum v):
    #    return vec2(self.x-v, self.y-v)

    #cpdef vec2 isub_vec(self, vec2 v):
    #    return vec2(self.x-v.x, self.y-v.y)
    
    # Products (*=)
    #def __imul__(self, v):
    #    return self.imul_realnum(v)

    #cpdef vec2 imul_realnum(self, realnum v):
    #    return vec2(self.x*v, self.y*v)

    ###################
    # UNARY OPERATORS #
    ###################

    # Negation
    def __neg__(self):
        return self.neg()

    cpdef vec2 neg(self):
        return vec2(-self.x, -self.y)

    # Identity
    def __pos__(self):
        return self.pos()

    cpdef vec2 pos(self):
        return vec2(self.x, self.y)

    # Absolute value (norm)
    def __abs__(self):
        return self.norm()

    cpdef double norm(self):
        return sqrt(self.x**2 + self.y**2)

    cpdef double sqr_norm(self):
        return self.x**2 + self.y**2
    
    ########################
    # COMPARISON OPERATORS #
    ########################

    # Equality
    def __eq__(self, v):
        return self.eq(v)

    cpdef bint eq(self, v):
        return (self.x == v.x) and (self.y == v.y)
    
    # Non-equality
    def __ne__(self, v):
        return self.ne(v)

    cpdef bint ne(self, v):
        return (self.x != v.x) or (self.y != v.y)

    # Less than
    def __lt__(self, v):
        return self.lt(v)

    cpdef bint lt(self, v):
        return abs(self) < abs(v)

    # Less than or equal to
    def __le__(self, v):
        return self.le(v)
    
    cpdef bint le(self, v):
        return abs(self) <= abs(v)

    # Greater than
    def __gt__(self, v):
        return self.gt(v)

    cpdef bint gt(self, v):
        return abs(self) > abs(v)

    # Greater than or equal to
    def __ge__(self, v):
        return self.ge(v)
    
    cpdef bint ge(self, v):
        return abs(self) >= abs(v)
