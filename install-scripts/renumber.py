"""Renumber the scripts by 10.

Starts at 010 and renumbers all scripts. Makes it easy to squeeze a new one in
(e.g. 015), and this will reset all to counting by 10s again.
"""

import itertools
import pathlib


sorted_shell_scripts = sorted(pathlib.Path(".").glob("*.sh"))
count_by_tens = itertools.count(10, 10)

for num, script in zip(count_by_tens, sorted_shell_scripts):
    base = str(script).split("-", maxsplit=1)[-1]
    script.rename(f"{num:03d}-{base}")
