#encoding:utf-8
require 'rubygems'
require 'capybara'
require 'capybara/dsl'

module CrawlPage

  class Blog
    include Capybara::DSL

    def initialize
      @config = Configuration.new('config_files/')
      Capybara.run_server = false
      Capybara.app_host = 'http://home.51cto.com/index.php?s=/Index/index/reback/http%253A%252F%252Fdown.51cto.com'
      Capybara.register_driver :selenium_firefox do |app|
        Capybara::Selenium::Driver.new(app, :browser => :firefox)
      end
      Capybara.current_driver = :selenium_firefox
    end

    def go_to_login_page
      visit('')
    end

    def login
      fill_in 'email',:with => @config.get_key('email')
      fill_in 'passwd',:with => @config.get_key('passwd')
      find(".loginbtn").click
    end

    def down
      find("#ld").click
    end
  end
end

