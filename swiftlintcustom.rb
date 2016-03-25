class Swiftlintcustom < Formula
  desc "Experimental tool to enforce Swift style and conventions"
  homepage "https://github.com/cdillard/SwiftLint"
  url "https://github.com/cdillard/SwiftLint.git", :tag => "1.0.0", :revision => "02c38d260d1f3bb728dd372fffe614ce472b38ad"
  head "https://github.com/cdillard/SwiftLint.git"

  depends_on :xcode => ["7.1", :build]

#  bottle do
#    cellar :any
#    sha256 "67c80a5bda6fc050ffda404bddd99143d04a4a0a10158f526d46e4ecee4ad37b" => :el_capitan
#    sha256 "b02a94fc5e994bb939dbe425edef01cd819d31beb3126abc3f62158bafa8dc82" => :yosemite
#  end

  def install
    bin.install "swiftlintcustomkeg"
    system "make", "prefix_install", "PREFIX=#{prefix}", "TEMPORARY_FOLDER=#{buildpath}/SwiftLint.dst"
  end

  test do
    (testpath/"Test.swift").write "import Foundation\n"
    system "#{bin}/swiftlintcustom"
  end
end
