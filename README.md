# Homebrew tap for SolidCraft

```sh
brew install --cask tangency-labs/tap/solidcraft
```

This installs the universal macOS build of [SolidCraft](https://solidcraft.io/), open-source
parametric 3D CAD, from the [GitHub releases](https://github.com/tangency-labs/solidcraft/releases).
Upgrade with `brew upgrade --cask solidcraft`.

The app isn't signed and notarized yet, so the cask clears the quarantine flag after install.

A GitHub Action (`.github/workflows/bump.yml`) checks for a new stable release every six hours and updates the cask.
