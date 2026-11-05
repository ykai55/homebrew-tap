cask "menulauncher" do
  version "0.2.1"
  sha256 "a6c48d7239bb3d7a111712bc1234332a3f61f428e93df2822c1e692761d2b227"

  url "https://github.com/ykai55/menubar-launcher/releases/download/v#{version}/MenuLauncher.zip"
  name "MenuLauncher"
  desc "Menu bar dropdown app launcher with stable layout, folders and pinyin search"
  homepage "https://github.com/ykai55/menubar-launcher"

  depends_on macos: ">= :sequoia"

  app "MenuLauncher.app"
  binary "#{appdir}/MenuLauncher.app/Contents/MacOS/MenuLauncher", target: "menulauncher"

  # 没有经过 Apple 公证，去掉隔离标记，否则首次打开会被 Gatekeeper 拦下
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/MenuLauncher.app"]
  end

  uninstall quit: "local.menulauncher"

  zap trash: [
    "~/.config/menulauncher",
    "~/Library/Preferences/local.menulauncher.plist",
  ]
end
