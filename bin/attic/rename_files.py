#!/usr/bin/env python
# Author:   --<Steven C. Howell>
# Purpose: 
# Created: 09/16/2014
# $Id: $

import sys
import os
import os.path as op
import subprocess
import argparse #http://docs.python.org/dev/library/argparse.html

import logging
LOGGER = logging.getLogger(__name__) #add module name manually


class MainError(Exception):
    pass
    

def main():
    os.chdir(ARGS.dir)
    process = subprocess.Popen('ls ' + '*' + ARGS.find + '*', 
                stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
    stdout, stderr = process.communicate()
    filenames = stdout.rstrip().split('\n')
    if len(filenames[0]) > 0:
        for filename in filenames:
            newname = filename.replace(ARGS.find,ARGS.replace)
            print 'Moving %s%s -> %s%s' % (ARGS.dir, filename, ARGS.dir, newname)
            cmd = 'mv %s %s' % (filename, newname)
            status = subprocess.call(cmd, shell=True)
    else:
        print "no files found with search: './%s*%s*'" % (ARGS.dir, ARGS.find)


def parse():
    ''' Returns arguments in parser'''
       
    parser = argparse.ArgumentParser(
        # prog='',
        # usage='',
        description = 'description here',
        # epilog = 'no epilog found'
        )   

    # parser.add_argument("positional", help='')
    # parser.add_argument("--option", metavar='', help='')   
    # parser.add_argument("-r","--run", default='all', help='crysol runname')   
    parser.add_argument("-f","--find", default='_000', help='string to find')   
    parser.add_argument("-r","--replace", default='_001', help='replacement stirng')
    parser.add_argument("-d","--dir", help='directory with files to replace')    
    return parser.parse_args()
    

if __name__ == '__main__':
    
    if '-v' in sys.argv:
        logging.basicConfig(level=logging.DEBUG)
    else:
        logging.basicConfig()

   # make ARGS global
    ARGS = parse()        
    main()