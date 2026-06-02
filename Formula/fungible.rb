class Fungible < Formula
  desc "Terminal personal finance manager with Plaid sync and AI categorization"
  homepage "https://github.com/tomfunk/fungible"
  url "https://github.com/tomfunk/fungible/archive/refs/tags/v1.6.0.tar.gz"
  sha256 "401ec1b135fcf077433d77402edcc58bcdac9186cb61d73892edc60ffa9300f6"
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
