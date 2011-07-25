module Teletext
  # Page parser for YLE Teletext API at http://blogit.yle.fi/kehitys-kehittyy/ylen-avoin-data-rajapinta-ylen-teksti-tvhen
  class Parser
    # Parse a retrieved page response, which must already have been JSON-decoded.
    def self.parse_response(data)
      data['pages'] && data['pages'].collect do |source|
        { :timestamp => data['timestamp'],
          :version => data['version'],
          :message => data['message'],
          :status => data['status'],
          :number => source['number'],
          :subpages => source['subpages'].collect do |subsource|
            { :number => subsource['number'],
              :timestamp => subsource['timestamp'],
              :raw_content => subsource['content']
            }
          end
        }
      end || [nil]
    end
  end
end
