class Podwise < Formula
  desc "CLI client for podwise.ai — turn any podcast episode into AI-powered insights"
  homepage "https://github.com/hardhackerlabs/podwise-cli"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hardhackerlabs/podwise-cli/releases/download/v#{version}/podwise_darwin_arm64.tar.gz"
      sha256 "03a69d796c2742d564c61a21bd51ac7164fb8d292a96c2d5e1374c503c19c016"
    else
      url "https://github.com/hardhackerlabs/podwise-cli/releases/download/v#{version}/podwise_darwin_amd64.tar.gz"
      sha256 "3a924aa8ce657248a98a73a0f4a7ee9bee4344791c4c0a0248ddc4500a9c4e88"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hardhackerlabs/podwise-cli/releases/download/v#{version}/podwise_linux_arm64.tar.gz"
      sha256 "1675b89bd663f5a716912c61bf8e4bde8658287b216c667be6c8c9d2a9842d7f"
    else
      url "https://github.com/hardhackerlabs/podwise-cli/releases/download/v#{version}/podwise_linux_amd64.tar.gz"
      sha256 "6d7e7544c37753c4f6153017ff29d85fbdd83b9567c55a278885ce15ae7d146d"
    end
  end

  def install
    bin.install "podwise"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/podwise --version")
  end
end
