class CSVReader                              # Create class CSVReader
  attr_accessor :fname, :headers             # Set accessor for fname for read nad write

  def initialize(filename)                   # Create initialize method    
    @fname = filename              
  end

  def headers=(header_str)                   # Create headers methoid for getters and setters
    @headers = header_str.split(',')       

    @headers.map! do |h|
      new_header = h.gsub('"', '')
      new_header.strip!
      new_header.underscore.to_sym
    end
  end

  def create_hash(values)                    # Create method to strip quotation and new lines then populate with cleansed value
    h = {}
    @headers.each_with_index do |header, i|
      value = values[i].strip.gsub('"', '')
      h[header] = value unless value.empty?
    end
    h
  end
end

class String                                 # Create method to convert to snake case
  def underscore
    self.gsub(/::/, '/').
    gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
    gsub(/([a-z\d])([A-Z])/,'\1_\2').
    tr("-", "_").
    downcase
  end
end

