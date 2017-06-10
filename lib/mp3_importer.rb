require 'pry'

class MP3Importer

  attr_accessor :path, :files

  def initialize(path)
    @path = path
    @files = []
  end

  def files
    files = Dir["#{self.path}/*.mp3"]
    files.collect {|long_file| long_file.slice!(self.path + '/') }
    @files = files
  end

  def import
    self.files.each {| file | Song.new_by_filename(file)}
  end

end
