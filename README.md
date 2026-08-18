# Homebrew Extras

These are some extra Homebrew formulae that I maintain.

## Install a formula

With Homebrew 6, the recommended approach is to install a fully qualified formula. This automatically taps the repository and trusts only the formula being installed:

```sh
brew install ascarter/extras/<formula>
```

To tap the repository and use a formula's short name, trust that formula explicitly:

```sh
brew tap ascarter/extras
brew trust --formula ascarter/extras/<formula>
brew install <formula>
```

If you use this tap frequently and trust every current and future item it contains, you may trust the entire tap instead:

```sh
brew tap ascarter/extras
brew trust --tap ascarter/extras
brew install <formula>
```

## Brewfile

In a `brew bundle` `Brewfile`, trust only the formula you need:

```ruby
tap "ascarter/extras", trusted: { formula: "<formula>" }
brew "ascarter/extras/<formula>"
```

Use `trusted: true` on the `tap` entry only when you intend to trust the entire tap.

## mise

mise can declaratively install Homebrew formulae with its `brew:` bootstrap package manager. For a third-party tap, use the fully qualified formula name:

```toml
[bootstrap.packages]
"brew:ascarter/extras/<formula>" = "latest"
```

Then apply the configuration with `mise bootstrap packages apply` (or `mise bootstrap`). mise's direct Homebrew support reads the tap's published Homebrew API metadata instead of invoking `brew`, so it does not use Homebrew's tap trust store. This tap must publish `api/formula/<formula>.json` metadata before mise can install its formulae; otherwise, use the Homebrew commands above.

## Documentation

See Homebrew's [tap trust documentation](https://docs.brew.sh/Tap-Trust), [Brewfile documentation](https://docs.brew.sh/Brew-Bundle-and-Brewfile), and [mise's Homebrew package documentation](https://mise.jdx.dev/bootstrap/packages/brew.html).
