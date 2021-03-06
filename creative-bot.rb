Process.daemon if ARGV.any? {|i| i == '-D' }

require 'slack-ruby-client'

token = ENV['token_parrot']

Slack.configure do |config|
  config.token = token
end

Slack::RealTime::Client.config do |config|
  config.start_method = :rtm_start
end

client = Slack::RealTime::Client.new

client.on :message do |data|
  text = data.text
  if text.include?('くりえいてぃぶ') || text.include?('クリエイティブ')
    client.message channel: data.channel, text: "...く、くりえいてぃぶの予感...?"
  end
  if text.include?(':fastparrot:')
    client.message channel: data.channel, text: "クリエイティブが加速する(　･ิω･ิ)"
  end
  if text.include?('SES')
    client.message channel: data.channel, text: "寝言は寝てから言い給え(　･ิω･ิ)"
  end
  if text.include?('集合！')
    client.message channel: data.channel, text: ":fastparrot::fastparrot::fastparrot::fastparrot::fastparrot::fastparrot::fastparrot::fastparrot::fastparrot::fastparrot::fastparrot::fastparrot::fastparrot:"
  end
  if text.include?('解散！')
    text = <<-EOS

      .
      .
      .
      .
      .
      .
      .
      .
      .
      .
      .
      .
      .
      .
      .
      .
      .
      .
      .
      .
      .
      .
      .
      .
      .
      .
      .
      .
      .
      .
      .
      .
      .
      .
      .
      EOS
    client.message channel: data.channel, text: text
  end
  if text.include?('静粛に！')
    client.message channel: data.channel, text: ":parrotsleep::parrotsleep::parrotsleep::parrotsleep::parrotsleep::parrotsleep::parrotsleep::parrotsleep::parrotsleep::parrotsleep::parrotsleep::parrotsleep::parrotsleep:"
  end
  if text.include?('酒豪！')
    client.message channel: data.channel, text: ":shuffleparrot::shuffleparrot::shuffleparrot::shuffleparrot::shuffleparrot::shuffleparrot::shuffleparrot::shuffleparrot::shuffleparrot::shuffleparrot::shuffleparrot::shuffleparrot::shuffleparrot::beer:"
  end
  puts data
end

client.start!
