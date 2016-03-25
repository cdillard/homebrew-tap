class Swiftlintcustom < Formula
  desc "Experimental tool to enforce Swift style and conventions"
  homepage "https://github.com/cdillard/SwiftLint"
  url "https://github.com/cdillard/SwiftLint.git", :tag => "1.0.0", :revision => "02c38d260d1f3bb728dd372fffe614ce472b38ad"
  head "https://github.com/cdillard/SwiftLint.git"

  depends_on :xcode => ["7.1", :build]

  bottle do
    cellar :any
    sha256 "02c38d260d1f3bb728dd372fffe614ce472b38ad" => :el_capitan
    sha256 "02c38d260d1f3bb728dd372fffe614ce472b38ad" => :yosemite
  end

  def install
    bin.install "swiftlint"
    system "make", "prefix_install", "PREFIX=#{prefix}", "TEMPORARY_FOLDER=#{buildpath}/SwiftLint.dst"
  end

  test do
    (testpath/"Test.swift").write "import Foundation\n"
    system "#{bin}/swiftlintcustom"
  end
end
