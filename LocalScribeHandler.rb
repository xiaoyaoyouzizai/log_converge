# encoding: utf-8
require 'scribe'
require 'logfile_transfer'

class LocalScribeHandler < LogfileTransfer::Handler
  def init
    @scribe_client = Scribe.new('127.0.0.1:1463')
  end
  def handle log_path, log_fn, line, line_count, pattern
    @scribe_client.log(line, pattern)
  end
end

LogfileTransfer.run ARGV, 2001, File.expand_path(File.dirname(__FILE__))