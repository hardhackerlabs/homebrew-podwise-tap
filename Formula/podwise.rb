class Podwise < Formula
  desc "CLI client for podwise.ai — turn any podcast episode into AI-powered insights"
  homepage "https://github.com/hardhackerlabs/podwise-cli"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hardhackerlabs/podwise-cli/releases/download/v#{version}/podwise_darwin_arm64.tar.gz"
      sha256 "7ccc8096a8635073930eec5cec1e06a7d217dbebee7d66b319558ae8e738c1ca"
    else
      url "https://github.com/hardhackerlabs/podwise-cli/releases/download/v#{version}/podwise_darwin_amd64.tar.gz"
      sha256 "4bd4c7cf7ce999fd682f9b15cd97c50c402a5f5ae227c6f64ead4079cc43824c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hardhackerlabs/podwise-cli/releases/download/v#{version}/podwise_linux_arm64.tar.gz"
      sha256 "d116ad9e5f51972d7b0afea6e5f3ddb06d1d879a3d3ccd2f65dda54752ca51c1"
    else
      url "https://github.com/hardhackerlabs/podwise-cli/releases/download/v#{version}/podwise_linux_amd64.tar.gz"
      sha256 "519fb4741ea83ef9dfb8f9d5142ca07854b9f26da7ee3932506ddce13c53009b"
    end
  end

  def install
    bin.install "podwise"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/podwise --version")
  end
end
