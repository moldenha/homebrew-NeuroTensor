class Neurotensor < Formula
  desc "High-performance tensor and topological data analysis library"
  homepage "https://github.com/moldenha/NeuroTensor"
  license "MIT"
  version "0.1.5"

  if Hardware::CPU.arm?
    url "https://github.com/moldenha/NeuroTensor/releases/download/v0.1.5/neurotensor-macos-arm64-v0.1.5.tar.gz"
    sha256 "30dead6cf600cf19f7ca619d44afb452df50251dfded66b33b7d99e9292254d8"
  elsif Hardware::CPU.intel?
    url "https://github.com/moldenha/NeuroTensor/releases/download/v0.1.5/neurotensor-macos-x86_64-v0.1.5.tar.gz"
    sha256 "e36c56fe7987c741f97f2c7018307564c66df6e99b79cfc25316b610c672215f"
  end
  def install
    # This installs libneurotensor.a into Homebrew’s lib path
    lib.install "lib/libneurotensor.a"
    include.install Dir["include/*"] if File.directory?("include")
  end

  resource "simde" do
    url "https://github.com/simd-everywhere/simde/archive/refs/tags/v0.8.2.tar.gz"
    sha256 "ed2a3268658f2f2a9b5367628a85ccd4cf9516460ed8604eed369653d49b25fb"
  end

  test do
    system "nm", "#{lib}/libneurotensor.a"
  end
end

