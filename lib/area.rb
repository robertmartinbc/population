class Area
  attr_accessor :zipcode, :estimated_population, :city, :state      # Set attribute accessor

  def initialize(hash)
    @zipcode = hash[:zipcode].to_i || 0                             # Create Hash to hold zipcode and convert to integer with default of zero
    @estimated_population = hash[:estimated_population].to_i || 0   # Create Hash to hold estimated population and convert to integer with default of zero
    @city = hash[:city] || "n/a"                                    # Create Hash to hold city with default of not applicable
    @state = hash[:state] || "n/a"                                  # Create Hash to hold state with default value of not applicable                   
  end

  def to_s
    "#{city}, #{state} has #{estimated_population} people"          # Create method to convert hash values to strings
  end
end