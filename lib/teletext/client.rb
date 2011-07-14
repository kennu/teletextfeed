require 'rubygems'
require 'json'
require 'net/http'
require 'uri'

module Teletext
  # Client for YLE Teletext API at http://blogit.yle.fi/kehitys-kehittyy/ylen-avoin-data-rajapinta-ylen-teksti-tvhen.
  class Client
    @@api_key = nil
    class << self
      # Global API key that can be configured at the class level
      attr_accessor :api_key
    end
    attr_accessor :api_key
    attr_accessor :base_url
    
    # Creates a teletext client with the specified API key.
    # === Parameters
    # * api_key = API key
    # === Example
    #  client = Teletext::Client.new('abcdefg')
    
    def initialize(api_key=nil)
      @api_key = api_key || self.class.api_key
      @base_url = 'http://beta.yle.fi/api/ttvcontent/'
    end
    
    # Crawls the whole teletext service, starting from start_page.
    # Returns an array of Hashes.
    def crawl(start_page=100)
      pages = []
      page = get_page(start_page)
      prev_number = 0
      while page != nil && page.number > prev_number
        yield page if block_given?
        pages << page
        prev_number = page.number
        page = get_next_page(page.number)
      end
      pages
    end
    
    # Retrieves a teletext page with the specified page number. If a list of page numbers
    # is specified, a list of Hashes is returned, otherwise a single page.
    # Returns nil on error.
    # === Parameters
    # * page_number = Teletext page between 100..899, or a list of pages: [100, 101, 102]
    # * return_content = Set to false to return only metadata about the page.
    # === Example
    #  page = client.get_page(100)
    
    def get_page(page_number, return_content=true)
      r = do_request(:p => page_number, :c => return_content)
      page_number.kind_of?(Array) ? r : r[0]
    end
    
    # Retrieves the next teletext page after the specified page number.
    # Returns a Hash or nil on error.
    # === Parameters
    # * page_number = Teletext page between 100..899
    # * return_content = Set to false to return only metadata about the page.
    # === Example
    #  page = client.get_next_page(100)
    
    def get_next_page(page_number, return_content=true)
      do_request(:p => page_number, :c => return_content, :s => 'next')[0]
    end
    
    # Retrieves the previous teletext page before the specified page number.
    # Returns a Hash or nil on error.
    # === Parameters
    # * page_number = Teletext page between 100..899
    # * return_content = Set to false to return only metadata about the page.
    # === Example
    #  page = client.get_next_page(100)
    
    def get_previous_page(page_number, return_content=true)
      do_request(:p => page_number, :c => return_content, :s => 'prev')[0]
    end
    
    def do_request(options)
      options[:a] = self.api_key
      options[:t] = 'json'
      url = URI.parse(@base_url)
      req = Net::HTTP::Get.new(url.path + '?' + options.to_query)
      res = Net::HTTP.start(url.host, url.port) do |http|
        http.request req
      end
      Parser.parse_response(JSON.parse(res.body))
    end
  end
end
