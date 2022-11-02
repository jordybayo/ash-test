#!/usr/bin/env python3 
#coding:utf-8


def main():
    instances = []
    with open('dev.log') as f:
        lines = f.readlines()
    for line in lines:
        message = line.find('cdsmon')
        if message != -1:
            instances.append(line.split()[5])
    return instances
    


if __name__ == "__main__":
    print(main())
