require './crawl.rb'
require './configuration.rb'

t = CrawlPage::Blog.new
t.go_to_login_page
t.login
t.down