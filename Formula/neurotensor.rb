class Neurotensor < Formula
  desc "High-performance tensor and topological data analysis library"
  homepage "https://github.com/moldenha/NeuroTensor"
  license "MIT"
  version "0.1.5"

  if Hardware::CPU.arm?
    url "https://github.com/moldenha/NeuroTensor/releases/download/v0.1.5/neurotensor-macos-arm64-v0.1.5.tar.gz"
    sha256 "30c56752b4f5ed15585a43c2847ae14a2421480065871351ff713d115d04cea3"
  elsif Hardware::CPU.intel?
    url "https://github.com/moldenha/NeuroTensor/releases/download/v0.1.5/neurotensor-macos-x86_64-v0.1.5.tar.gz"
    sha256 "b8461f40c72be03dbef5366803c3405ced4d64b09d5a93ae783cfad2bec59dd0"
  end
  def install
    # This installs libneurotensor.dylib into Homebrew’s lib path
    lib.install "lib/libneurotensor.dylib"
    include.install Dir["include/*"] if File.directory?("include")
  end

  test do
    system "nm", "#{lib}/libneurotensor.dylib"
  end
end

