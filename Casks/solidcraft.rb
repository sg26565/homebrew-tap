cask "solidcraft" do
  version "0.21.0"
  sha256 "f6d0b02e3142e4a966114467c89824a1a42e7042bf92a0f3d1299634244cf68c"

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

  zap trash: [
    "~/Library/Application Support/solidcraft",
    "~/Library/Caches/solidcraft",
  ]
end
