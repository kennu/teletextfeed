# Crawl the teletext API and update all modified pages.
task :poll => :environment do
  client = Teletext::Client.new
  client.crawl do |tpage|
    puts tpage[:number]
    page = Page.find_or_create_by_number(tpage[:number])
    page.number = tpage[:number]
    page.save
    tpage[:subpages].each do |tsubpage|
      puts ' - ' + tpage[:number].to_s + '/' + tsubpage[:number].to_s
      subpage = Subpage.find_or_create_by_page_id_and_subnumber(page.id, tsubpage[:number])
      subpage.page = page
      subpage.number = tpage[:number]
      subpage.subnumber = tsubpage[:number]
      subpage.raw_content = tsubpage[:raw_content]
      subpage.save
    end
  end
end
