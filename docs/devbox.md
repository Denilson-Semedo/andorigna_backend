# devbox

## What is it

Devbox is a command-line tool that lets you easily create isolated shells for development. You start by defining the list of packages required by your development environment, and devbox uses that definition to create an isolated environment just for your application.

In practice, Devbox works similar to a package manager like yarn – except the packages it manages are at the operating-system level (the sort of thing you would normally install with brew or apt-get).

## Installing devbox

To install simple run:

```shell
curl -fsSL https://get.jetpack.io/devbox | bash
```

## initialize

```shell
devbox init
```

## how to run

```shell
devbox shell
```

To add new packages please refer to [nixOS-pkg](https://search.nixos.org/packages)

```shell
devbox add $(package_name)
```

## References

Install devbox

- [devbox](https://github.com/jetpack-io/devbox)
- [nixos](https://nixos.org/)
- [nix-packages](https://search.nixos.org/packages)
