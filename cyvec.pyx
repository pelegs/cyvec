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
    # UNARY OPERATIONS #
    ####################

    #####################
    # BINARY OPERATIONS #
    #####################

    # Equality
    def __eq__(self, v):
        return self.eq(v)

    cpdef bint eq(self, v):
        return (self.x == v.x) and (self.y == v.y)

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
