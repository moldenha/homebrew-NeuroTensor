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
    sha256 "3842b8a12a95357856d85083ad893ae25df7af1ab84cd3f9374d3ecfd0bf3d05"
  end
  

  def install
    # This installs libneurotensor.a into Homebrew’s lib path
    lib.install "lib/libneurotensor.a"
    Pathname("include").each_child do |entry|
      include.install entry unless entry.basename.to_s == "boost" || entry.basename.to_s == "tbb" || entry.basename.to_s == "oneapi"
      # include.install entry
    end
    # include.install Dir["include/*"] => "neurotensor"
    # include.install Dir["include/*"] if File.directory?("include")

  end



  test do
    system "nm", "#{lib}/libneurotensor.a"
  end
end

