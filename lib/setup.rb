require_relative 'csv_reader'              # Provide access to CSVReader class methods
require_relative 'area'                    #Provide access to Area class methods

class Setup
  attr_accessor :areas

  def initialize
    csv = CSVReader.new("./zipcode-db.csv")    # Create new instance of CSVReader class using zipcode file and assign to local variable CSV
    @areas = []                                # Create array to hold area data
    csv.read do |item|                         # Iterate through each item in the Hash
      @areas << Area.new(item)                       # Shovel data into array
    end
    self                                       # Initialize method returns itself
  end
end