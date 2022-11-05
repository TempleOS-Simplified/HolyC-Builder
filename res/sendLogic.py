import subprocess, os, sys, time


def cmd(c):
    subprocess.run(c, shell=True, env=dict(os.environ, DOTNET_SYSTEM_GLOBALIZATION_INVARIANT="1"))

inp = "Test"
newinp = '-'.join(inp)
result = ""
cmd(f'echo "sendkey r-u-n-dot" | ncat 127.0.0.1 1234')
for i in newinp:
    if i.isupper() == True:
        result = result + "shift-" + i.lower()
        result.removeprefix('-')

        cmd(f'echo "sendkey {result}" | ncat 127.0.0.1 1234')
        result=""
    else:
        result = result.removeprefix('-') + i.lower()
cmd(f'echo "sendkey {result}" | ncat 127.0.0.1 1234')
cmd(f'echo "sendkey kp_enter" | ncat 127.0.0.1 1234')
