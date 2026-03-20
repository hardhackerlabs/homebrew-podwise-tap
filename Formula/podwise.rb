class Podwise < Formula
  desc "CLI client for podwise.ai — turn any podcast episode into AI-powered insights"
  homepage "https://github.com/hardhackerlabs/podwise-cli"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hardhackerlabs/podwise-cli/releases/download/v#{version}/podwise_darwin_arm64.tar.gz"
      sha256 "dd5d0521932c1b1d82c144b03a9742fc6abbcfeec4ce230129957349c9fc16d0"
    else
      url "https://github.com/hardhackerlabs/podwise-cli/releases/download/v#{version}/podwise_darwin_amd64.tar.gz"
      sha256 "68c5206e08c33dd9211782f41be4d2decd6c3669f761691bd8bbcd651e4d6747"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hardhackerlabs/podwise-cli/releases/download/v#{version}/podwise_linux_arm64.tar.gz"
      sha256 "3f7aa01a082749468e8b6ab4dc57c469a19222d448f59c43d969530e274135b7"
    else
      url "https://github.com/hardhackerlabs/podwise-cli/releases/download/v#{version}/podwise_linux_amd64.tar.gz"
      sha256 "f9f4444be5a369c6129344413a3239d15544d0588718448641684c4e5077be85"
    end
  end

  def install
    bin.install "podwise"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/podwise --version")
  end
end
