#!/usr/bin/python
import re
pattern = r'"(.*)"'
pat = re.compile(pattern)
f = open('proxy.pac')
content = f.read()
f.close()
f2 = open('rulelist.txt','w')
result = pat.findall(content)[1:]
for i in result:
    f2.write('*.%s\n' % i)
f2.close()
