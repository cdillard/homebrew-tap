class Swiftlint < Formula
  desc "Experimental tool to enforce Swift style and conventions"
  homepage "https://github.com/cdillard/SwiftLint"
  url "https://github.com/cdillard/SwiftLint.git", :tag => "1.0.0", :revision => "5d0a6e6c0c86ab53f4b04cc6a3c2dc3f3d6e80d8"
  head "https://github.com/cdillard/SwiftLint.git"

  depends_on :xcode => ["7.1", :build]

  def install
    system "make", "prefix_install", "PREFIX=#{prefix}", "TEMPORARY_FOLDER=#{buildpath}/SwiftLint.dst"
  end

  test do
    (testpath/"Test.swift").write "import Foundation\n"
    system "#{bin}/swiftlint"
  end
end
