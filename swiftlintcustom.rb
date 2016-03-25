class SwiftlintCustom < Formula
  desc "Experimental tool to enforce Swift style and conventions"
  homepage "https://github.com/cdillard/SwiftLint"
  url "https://github.com/cdillard/SwiftLint.git", :tag => "1.0.0", :revision => "bc68ad4fdff25bb70c6cbeb3be7ab13b2bfedbd2"
  head "https://github.com/cdillard/SwiftLint.git"

  depends_on :xcode => ["7.1", :build]

  def install
    bin.install "swiftlintcustom"
    system "make", "prefix_install", "PREFIX=#{prefix}", "TEMPORARY_FOLDER=#{buildpath}/SwiftLint.dst"
  end

  test do
    (testpath/"Test.swift").write "import Foundation\n"
    system "#{bin}/swiftlint"
  end
end
