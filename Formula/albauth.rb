class Albauth < Formula
  desc "MCP server for calling HTTP APIs behind an OIDC login proxy"
  homepage "https://dhanesh.github.io/albauth/"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dhanesh/albauth/releases/download/v0.4.0/albauth_v0.4.0_darwin_arm64.tar.gz"
      sha256 "d19428bd2e92c5350b47ce8df2b30a1f22a7d7cdd56297e704719b043f97a0ce"
    end
    on_intel do
      url "https://github.com/dhanesh/albauth/releases/download/v0.4.0/albauth_v0.4.0_darwin_amd64.tar.gz"
      sha256 "6f8f125293cf0686017f58643a1f3b114a0ff0d9ed3b6f25348905ea51a3b4b1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dhanesh/albauth/releases/download/v0.4.0/albauth_v0.4.0_linux_arm64.tar.gz"
      sha256 "d5534cd79c543e1903c8b9faff3ab213f79b016a140b7e0a6d0050b4569ea66a"
    end
    on_intel do
      url "https://github.com/dhanesh/albauth/releases/download/v0.4.0/albauth_v0.4.0_linux_amd64.tar.gz"
      sha256 "16ba3b2babe2664f26fb97c300332df1e834289867678f87c0c98eac38162730"
    end
  end

  def install
    bin.install "albauth"
    pkgshare.install "config.example.toml"
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/albauth version")
    assert_match "config.toml", shell_output("#{bin}/albauth --config #{testpath}/config.toml config path")
  end
end
