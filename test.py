#!/usr/bin/env python3
# -*- coding: iso-8859-15 -*-

"""
At the moment I'm running all the tests manually.
"""

from cyvec import vec2

v1 = vec2(1, 2.4)
v2 = vec2(-3, 2)
print('v1 =', v1)
print('v2 =', v2)
print('v1==v2?', v1==v2)
print('v2==v1?', v2==v1)
print('v1==v1?', v1==v1)
print('v2==v2?', v2==v2)
print('v1+v2 =', v1+v2)
print('v2+v1 =', v2+v1)
print('v1+2 =', v1+2)
print('2+v1 =', 2+v1)
print('v1-v2 =', v1-v2)
print('v2-v1 =', v2-v1)
print('v1-2 =', v1-2)
print('2-v1 =', 2-v1)
print('2*v1 =', 2*v1)
print('v1*2 =', v1*2)
print('2*v2 =', 2*v2)
print('v2*2 =', v2*2)
print('v1.v2 = ', v1*v2)
print('v2.v1 = ', v2*v1)
