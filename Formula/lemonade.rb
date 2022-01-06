class Lemonade < Formula
  desc "Lemonade is a remote utility tool. (copy, paste and open browser) over TCP."
  homepage "https://github.com/lemonade-command/lemonade"
  license "MIT"

  url "https://github.com/lemonade-command/lemonade/archive/97ad2f7d63cbe6c696af36a754d399b4be4553bc.zip"
  sha256 "858c5d58c0dbf5b9be72f4fd7f6340997eeb5ae0acff1af3ab9f45d7086e366b"
  version "97ad2f7d63cbe6c696af36a754d399b4be4553bc"

  head "https://github.com/lemonade-command/lemonade.git"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args, "-ldflags", "-X github.com/lemonade-command/lemonade/lemon.Version=#{version} -s -w"
  end

  def test
    assert_match("Version", shell_output("bash -c '#{bin}/lemonade --help 2>&1 || true'").strip)
  end
end
