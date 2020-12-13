#!/usr/bin/env python3
# -*- coding: iso-8859-15 -*-

"""
At the moment I'm running all the tests manually.
"""

from cyvec import vec2
from numpy import pi, sqrt


v1 = vec2(-3.7,1.5)
v2 = v1.scaleto(1.337)
print(v1)
print(v2)
print(v1/v2)
print(abs(v2))
