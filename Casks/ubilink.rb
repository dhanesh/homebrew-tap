cask "ubilink" do
  version "0.1.0-rc.5"
  sha256 "c7d0af0d96b838f92cce2795471fa841b8984b462088ee2f37fe1949d6872dc7"

  # The DMG is named after the app version, which carries no -rc suffix.
  url "https://github.com/dhanesh/ubilink/releases/download/v#{version}/Ubilink-#{version.sub(/-rc\.\d+$/, "")}-universal.dmg"
  name "Ubilink"
  desc "Menu-bar app that copies a link to whatever you're looking at"
  homepage "https://dhanesh.github.io/ubilink/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "Ubilink.app"

  uninstall quit: "org.dhanesh.ubilink"

  zap trash: [
    "~/Library/Application Support/org.dhanesh.ubilink",
    "~/Library/Caches/org.dhanesh.ubilink",
    "~/Library/HTTPStorages/org.dhanesh.ubilink",
    "~/Library/Preferences/org.dhanesh.ubilink.plist",
    "~/Library/Saved Application State/org.dhanesh.ubilink.savedState",
  ]
end
