Python 3.5.2 (v3.5.2:4def2a2901a5, Jun 25 2016, 22:01:18) [MSC v.1900 32 bit (Intel)] on win32
Type "copyright", "credits" or "license()" for more information.
>>> cubes = []
>>> cubes.append[1]
Traceback (most recent call last):
  File "<pyshell#1>", line 1, in <module>
    cubes.append[1]
TypeError: 'builtin_function_or_method' object is not subscriptable
>>> cubes.append(1)
>>> cubes.append(8)
>>> cubes.append(26)
>>> cubes
[1, 8, 26]
>>> cubes[2]=27
>>> cubes
[1, 8, 27]
>>> cubes.append(216)
>>> cubes
[1, 8, 27, 216]
>>> cubes[-1]
216
>>> cubes[-3:]
[8, 27, 216]
>>> no
