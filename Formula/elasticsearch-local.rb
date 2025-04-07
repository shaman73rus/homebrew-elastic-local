class ElasticsearchLocal < Formula
  desc "Local elasticsearch instance with custom service"
  homepage "https://github.com/shaman73rus/homebrew-elastic-local"
  version "8.17.4"
  url "file:///opt/homebrew/opt/elasticsearch-8.17.4-darwin-x86_64.tar.gz"
  sha256 "06ee63e50b77e7d88b5292b7fb173564e069b453cd6a7e948570f290714b62ac"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/elasticsearch"
  end

  service do
    run [opt_bin/"elasticsearch"]
    environment_variables(
      "JAVA_HOME" => "/opt/homebrew/opt/openjdk@17"
    )
    working_dir var
    log_path var/"log/elasticsearch-local.log"
    error_log_path var/"log/elasticsearch-local-error.log"
  end
end