#!/usr/bin/python
# -*- coding: utf-8 -*-
# python 3.6.*
# @author Patrick Jominet

import argparse
import sys


def main(argv):
    cid = ''
    parser = argparse.ArgumentParser()
    parser.add_argument('-i', metavar='<collection-ID>', help='REQUIRED: Collection-ID')

    args = parser.parse_args()
    if not args.i:
        print('Please specify a steam workshop collection ID (or try -h or --help for more information)')
        sys.exit()
    if args.i:
        cid = args.i
