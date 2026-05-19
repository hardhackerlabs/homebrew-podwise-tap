class Podwise < Formula
  desc "CLI client for podwise.ai — turn any podcast episode into AI-powered insights"
  homepage "https://github.com/hardhackerlabs/podwise-cli"
  version "0.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hardhackerlabs/podwise-cli/releases/download/v#{version}/podwise_darwin_arm64.tar.gz"
      sha256 "7b8255c4c25b5bed713b9a1dec92cb6be6073c79f330d65cce8276ab2ea3c9eb"
    else
      url "https://github.com/hardhackerlabs/podwise-cli/releases/download/v#{version}/podwise_darwin_amd64.tar.gz"
      sha256 "82a2c047a6d600e312733bfb1a153f58b3e2ff973864c895a635e930d03871a9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hardhackerlabs/podwise-cli/releases/download/v#{version}/podwise_linux_arm64.tar.gz"
      sha256 "09ff768e4675e08ed12d75237293979125ce85d3aec0fd4551bc59c7616614f0"
    else
      url "https://github.com/hardhackerlabs/podwise-cli/releases/download/v#{version}/podwise_linux_amd64.tar.gz"
      sha256 "bb014d46fc975b1dbce131b5d41ecb93bd3634f425b540628bfb170d7a3109ce"
    end
  end

  def install
    bin.install "podwise"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/podwise --version")
  end
end
