cask "solidcraft" do
  version "0.23.0"
  sha256 "939da44bd910005d95de16f0bc8132a90eb94f687583da23249d1add0be1d144"

  url "https://github.com/tangency-labs/solidcraft/releases/download/v#{version}/solidcraft-#{version}-macos-universal.dmg"
  name "SolidCraft"
  desc "Open-source parametric 3D CAD"
  homepage "https://solidcraft.io/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "SolidCraft.app"
  binary "#{appdir}/SolidCraft.app/Contents/MacOS/solidcraft-cli"

  # Releases are ad-hoc signed and not notarized yet, so Gatekeeper would block the first launch.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/SolidCraft.app"],
        writable_paths: ["{{appdir}}/SolidCraft.app"]
  end

  zap trash: [
    "~/Library/Application Support/solidcraft",
    "~/Library/Caches/solidcraft",
  ]
end
