class Podwise < Formula
  desc "CLI client for podwise.ai — turn any podcast episode into AI-powered insights"
  homepage "https://github.com/hardhackerlabs/podwise-cli"
  version "0.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hardhackerlabs/podwise-cli/releases/download/v#{version}/podwise_darwin_arm64.tar.gz"
      sha256 "49213f42308e96ca3203fe0ef42813fa334b866353e45dfe36e21290189a2770"
    else
      url "https://github.com/hardhackerlabs/podwise-cli/releases/download/v#{version}/podwise_darwin_amd64.tar.gz"
      sha256 "3fd3b315b3128f7d82ba2870c3e6a9bab3a2775184d3a0054e7f93c50e1f8cd2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hardhackerlabs/podwise-cli/releases/download/v#{version}/podwise_linux_arm64.tar.gz"
      sha256 "20cce98cb4687a3454b8c8e8d047e142605f494e4a769733df8117d81e3986db"
    else
      url "https://github.com/hardhackerlabs/podwise-cli/releases/download/v#{version}/podwise_linux_amd64.tar.gz"
      sha256 "84f7a4b1c457abd238dc69b41ceec91cbcf665c20a84b43287b0f09627c10609"
    end
  end

  def install
    bin.install "podwise"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/podwise --version")
  end
end
