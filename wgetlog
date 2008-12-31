#!/usr/bin/env python
# Skip boring parts from wget log file
import sys

if len(sys.argv) < 2:
	filename = 'download.log'
else:
	filename = sys.argv[1]

buf = []
write = True
context = 0

for line in file(filename):
	if line.find('....') == -1:
		if not write:
			sys.stdout.write(''.join(buf))
			del buf[:]
		sys.stdout.write(line)
		write = True
	else:
		buf.append(line)
		if len(buf) > 3:
			del buf[0]
		if write:
			write = False
			context = 0
		if context == 3:
			sys.stdout.write(''.join(buf))
			print ' ---'
		context += 1
sys.stdout.write(''.join(buf))
print
