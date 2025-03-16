# homelab-nixos-configs-demo

Demo of NixOS configurations for systems in my homelab.

## devbox & nix-shell

Adding two wrapper scripts for `devbox` for starting a shell and running
commands without installing them first.

Using `nix-shell` to first start a shell that has `devbox` in it to then start
the `devbox shell`.

I'm also including `shell.nix` for `nix-shell.

There's always more than one way to run commands on a brand new NixOS system.

These shells are meant to provide the basics to make it easier to pull in
configuration flakes to configure the server for it's role.

### wrapper scripts

#### devbox run nvim

"Wrapper" script for running a preconfigured editor.

```bash
[vpayno@nixos:~/homelab-nixos-configs]$ ./devbox-run nvim --version
 ____________________
< Welcome to devbox! >
 --------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
NVIM v0.10.4
Build type: Release
LuaJIT 2.1.1713773202
Run "nvim -V1 -v" for more info

real    0m1.779s
user    0m0.437s
sys     0m0.214s
```

#### nix-run

`nix-run` takes a command and runs it in the `nix-shell`.

```bash
$ ./nix-run date
 _______________________
< Welcome to nix-shell! >
 -----------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
Sat Feb 22 09:23:56 PM PST 2025

real	0m1.475s
user	0m0.774s
sys	0m0.324s
```

#### devbox-run

`devbox-run` is like `nix-run` but uses `nix-shell` to run `devbox` to run your
command.

```bash
$ ./devbox-run date
Info: Ensuring packages are installed.
 ____________________
< Welcome to devbox! >
 --------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
Sat Feb 22 21:28:39 PST 2025

real	0m1.219s
user	0m0.710s
sys	0m0.219s
```

#### devbox-shell

`devbox-shell` uses `nix-shell` to run `devbox` to start a developer shell.

```bash
[vpayno@nixos:~/homelab-nixos-configs]$ ./devbox-shell
Starting a devbox shell...
 ____________________
< Welcome to devbox! >
 --------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
(devbox)
[vpayno@nixos:~/homelab-nixos-configs]$
```

#### nix-shell

Not a wrapper script but it's still useful.

```bash
[vpayno@nixos:~/homelab-nixos-configs]$ nix-shell
 _______________________
< Welcome to nix-shell! >
 -----------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

[nix-shell:~/homelab-nixos-configs]$
```
