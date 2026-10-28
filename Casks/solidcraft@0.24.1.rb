cask "solidcraft@0.24.1" do
  version "0.24.1"
  sha256 "8c741a95db2504d3ef85ebfd09d077dfca46462ac86681df66f5df463432e126"

  url "https://github.com/tangency-labs/solidcraft/releases/download/v#{version}/solidcraft-#{version}-macos-universal.dmg"
  name "SolidCraft"
  desc "Open-source parametric 3D CAD"
  homepage "https://solidcraft.io/"

  livecheck do
    skip "Versioned cask"
  end

  conflicts_with cask: "solidcraft"
  depends_on :macos

  app "SolidCraft.app"
  binary "#{appdir}/SolidCraft.app/Contents/MacOS/solidcraft-cli"

  # Releases are ad-hoc signed and not notarized, so Gatekeeper would block the first launch.
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
