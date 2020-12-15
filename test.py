#!/usr/bin/env python3
# -*- coding: iso-8859-15 -*-

"""
At the moment I'm running all the tests manually.
"""

from cyvec import *
import numpy as np


arr = np.random.uniform(size=2)
print(arr)
v = vec2_from_np(arr)
print(v)
arr2 = np_from_vec2(v)
print(arr2)
print(np.array_equal(arr, arr2))
