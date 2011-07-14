Teletext::Client.api_key = YAML::load(File.open("#{RAILS_ROOT}/config/teletext.yml"))['api_key']
