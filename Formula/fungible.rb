class Fungible < Formula
  desc "Terminal personal finance manager with Plaid sync and AI categorization"
  homepage "https://github.com/tomfunk/fungible"
  url "https://github.com/tomfunk/fungible/archive/refs/tags/v1.8.0.tar.gz"
  sha256 "8943d31b8cc5cfddcb325e6599ce100e28f90b4549c7e98c7ed05e3419eb40ea"
  license "ISC"

  depends_on "node"

  def install
    system "npm", "ci", "--omit=dev"
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fungible"
  end

  def caveats
    <<~EOS
      Run `fungible --setup` on first launch to configure Plaid credentials.
      Data and config are stored in ~/.fungible/
    EOS
  end

  test do
    assert_predicate bin/"fungible", :executable?
  end
end
