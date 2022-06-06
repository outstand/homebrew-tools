class Lemonade < Formula
  desc "Lemonade is a remote utility tool. (copy, paste and open browser) over TCP."
  homepage "https://github.com/lemonade-command/lemonade"
  license "MIT"

  url "https://github.com/lemonade-command/lemonade/archive/refs/tags/v1.1.2.zip"
  sha256 "28d8397a63cc3c18f46ae7017d6d2b42fa31d83527a0a4577f819fa3293d5283"
  version "1.1.2"

  head "https://github.com/lemonade-command/lemonade.git"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args, "-ldflags", "-X github.com/lemonade-command/lemonade/lemon.Version=#{version} -s -w"
  end

  def test
    assert_match("Version:\n  #{version}", shell_output("bash -c '#{bin}/lemonade --help 2>&1 || true'").strip)
  end
end
