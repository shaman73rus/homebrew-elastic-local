class KibanaLocal < Formula
  desc "Local Kibana instance (8.17.4) for development"
  homepage "https://www.elastic.co/kibana/"
  version "8.17.4"
  url "file:///opt/homebrew/opt/kibana-8.17.4-darwin-x86_64.tar.gz"
  sha256 "011651f9164930a1dd6b2fe7010863688a33d313bfe69ea655b955925de70d76"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/kibana"
  end

  service do
    run [opt_bin/"kibana"]
    working_dir var
    log_path var/"log/kibana.log"
    error_log_path var/"log/kibana-error.log"
    environment_variables(
      "NODE_OPTIONS" => "--max-old-space-size=2048"
    )
  end
end