require 'yaml'

class Project
  
  attr_reader :path, :body

  def initialize(path)
    data, @body = File.read(path).split(/\n\n/, 2)
    @yaml = YAML.load(data)
  end

  def self.all(path = "projects")
    Dir["#{path}/*.txt"].reverse.collect { |file| new(file) }
  end

  private

  def method_missing(method_sym, *arguments, &block)
    if @yaml[method_sym.to_s] 
      @yaml[method_sym.to_s]
    else
      super
    end
  end
  
end

