require 'yaml'
require 'erb'
class Configuration
  PARAMS_FILE_PATH = File.join(File.dirname(__FILE__), '', '')

  def initialize(dirname)
    @hash = {}
    Dir.foreach(PARAMS_FILE_PATH + dirname).each do |file_name|
      if file_name != '.' and file_name != '..'
        puts PARAMS_FILE_PATH + dirname + file_name
        @hash.merge!(YAML::load(File.read(PARAMS_FILE_PATH + dirname +file_name)))
      end
    end
    self
  end

  def get_key(key)
    if @hash[key].nil?
      return key
    end
    @hash[key]
  end
end
