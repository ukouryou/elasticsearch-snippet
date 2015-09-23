#!/usr/bin/python3
import os
indexName={'dam','course','project'}
for index in indexName:
	os.chdir(index)
	print(os.getcwd())
	os.system('sh setupIndex.sh')
	os.chdir('..')
		
