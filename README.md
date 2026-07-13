<p align="center">
  <img src="logo/markgraf-256.png" alt="markgraf" width="128" />
</p>

# markgraf

Animated graph diagrams from a tiny declarative source language.

## Install

```sh
brew install --cask markgrafhq/tap/markgraf
```

## Usage

```sh
markgraf hello.markgraf -o hello.mp4
markgraf hello.markgraf --play           # interactive preview
pbpaste | markgraf - -o out.mp4          # pipe from stdin
```

## Examples

See [`examples/`](examples/) for `.markgraf` source files.

A 2-node hello:

```
scene setup {
  + a: A
  + b: B
  + a -> b
}

scene greet {
  a ~> b: hello
}
```
