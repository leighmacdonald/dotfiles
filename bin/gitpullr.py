#!/usr/bin/env python

from os import listdir, getcwd, chdir
from os.path import exists, join
from logging import getLogger
from subprocess import Popen

log = getLogger(__name__)

def pull(repo_dir):
    orig_dir = getcwd()
    cmd = ['git', 'pull']
    p = Popen(cmd, cwd=repo_dir)
    p.wait()
    chdir(orig_dir)


def update_git_repos(path="./"):
    for entry in listdir(path):
        git_path = join(path, entry, '.git')
        if exists(git_path):
            log.info("Found git repo @ {0}".format(git_path))
            pull(join(path, entry))

if __name__ == "__main__":
    from logging import basicConfig, INFO

    basicConfig(level=INFO)
    from argparse import ArgumentParser

    arg_parser = ArgumentParser(prog="gitpullr.py",
        description="Find git repos under a path and update them")
    arg_parser.add_argument('paths', metavar="PATH", nargs="+", help="Path to scan for repos")
    args = arg_parser.parse_args()
    ret_val = 1
    try:
        for path in args.paths:
            update_git_repos(path)
    except Exception as err:
        log.error(err)
    else:
        ret_val = 0
    finally:
        exit(ret_val)