class ElasticsearchLocal < Formula
  desc "Local elasticsearch instance with custom service"
  homepage "https://github.com/shaman73rus/homebrew-elastic-local"
  version "8.17.4"
  url "file:///opt/homebrew/elasticsearch-8.17.4-darwin-x86_64.tar.gz"
  sha256 "dummy" # неважно, так как мы не используем скачивание

  def install
    prefix.install Dir["*"]
  end

  plist_options manual: "elasticsearch"

  def plist
    <<~EOS
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
        <dict>
          <key>Label</key>
          <string>#{plist_name}</string>

          <key>ProgramArguments</key>
          <array>
            <string>/opt/homebrew/elasticsearch-8.17.4/bin/elasticsearch</string>
          </array>

          <key>WorkingDirectory</key>
          <string>/opt/homebrew/elasticsearch-8.17.4</string>

          <key>EnvironmentVariables</key>
          <dict>
            <key>JAVA_HOME</key>
            <string>/opt/homebrew/opt/openjdk@17</string>
          </dict>

          <key>KeepAlive</key>
          <true/>

          <key>RunAtLoad</key>
          <true/>

          <key>StandardOutPath</key>
          <string>/tmp/elasticsearch-local.out.log</string>
          <key>StandardErrorPath</key>
          <string>/tmp/elasticsearch-local.err.log</string>
        </dict>
      </plist>
    EOS
  end
end
