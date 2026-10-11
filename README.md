# dhanesh/homebrew-tap

Homebrew formulae and casks for tools by [@dhanesh](https://github.com/dhanesh).

## Ubilink

A macOS menu-bar app that copies a link to whatever you're looking at and keeps a
two-way graph of the links you make. Source and releases:
[dhanesh/ubilink](https://github.com/dhanesh/ubilink).

```sh
brew install --cask dhanesh/tap/ubilink
```

Upgrade with `brew upgrade --cask ubilink`. `brew uninstall --cask ubilink` removes the
app and keeps your link graph; `brew uninstall --zap --cask ubilink` removes the graph
and settings too.

## albauth

An MCP server that lets a model call HTTP APIs sitting behind a login proxy — an
AWS ALB `authenticate-oidc` rule, oauth2-proxy, Traefik `forwardAuth`. Site:
[dhanesh.github.io/albauth](https://dhanesh.github.io/albauth/). Source and
releases: [dhanesh/albauth](https://github.com/dhanesh/albauth).

```sh
brew install dhanesh/tap/albauth
```

Upgrade with `brew upgrade albauth`. An annotated example config is installed at
`$(brew --prefix)/share/albauth/config.example.toml`.
