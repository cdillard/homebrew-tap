class SwiftlintCustom < Formula
  desc "Experimental tool to enforce Swift style and conventions"
  homepage "https://github.com/cdillard/SwiftLint"
  url "https://github.com/cdillard/SwiftLint.git", :tag => "1.0.0", :revision => "bc68ad4fdff25bb70c6cbeb3be7ab13b2bfedbd2"
  head "https://github.com/cdillard/SwiftLint.git"

  depends_on :xcode => ["7.1", :build]
  
  bottle do
    sha256 "89c8215f9e670819e065820a3fd59dee56c7e59f9e304f799f2b319db372f998" => :el_capitan
    sha256 "0c8cce6920444c2b7d6ea524bc9881f2e19c6ced735bb4f833cb6e04c49c5ffc" => :yosemite
    sha256 "0899dfe6dbc824bdf5b589020063c711c51fde9a6cca87048ec352779c2cbcf1" => :mavericks
  end

  def install
    bin.install "swiftlintcustom"
    system "make", "prefix_install", "PREFIX=#{prefix}", "TEMPORARY_FOLDER=#{buildpath}/SwiftLint.dst"
  end

  test do
    (testpath/"Test.swift").write "import Foundation\n"
    system "#{bin}/swiftlint"
  end
end
