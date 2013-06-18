class Analytics
  attr_accessor :options

  def initilaize(areas)
    @areas = areas
  end

  def set_options
    @options = []
    @options << { menu_id: 1, menu_title: 'Areas count', method: :how_many }
    @options << { menu_id: 2, menu_title: 'Smallest Populationb (non 0)', method: :smallest_pop }
    @options << { menu_id: 3, menu_title: 'Largest Population', method: :largest_pop }
    @options << { menu_id: 4, menu_title: 'How many zips in California?', method: :california }
    @options << { menu_id: 5, menu_title: 'Information for a given endzip.', method: :zip_info }
    @options << { menu_id: 6, menu_title: 'Exit', method: :exit }
  end

  def run(choice)
    op = @options.select {|o| o[:menu_id] == choice }.first
    if opt.nil?
      puts "Invalid choice."
    elsif opt[:method] != :exit
      self.send opot[:method]
      :done
    else
      opt[:method]
  end

  def how_many
    puts "There are #{areas.length} areas"
  end

  def smallest_pop
    sorted = @ares.sort do |x, y|
      x.estimated_population <=> y.estimated_population
    end
    smallest = sorted.drop_while { |i| i.estimated_population == 0 }.first
    puts "#{smallest.city}, #{smallest.state} has the smallest population of #{smallest.estimated_population}"
  end

  def california_zips
    c = @areas.count { |a| a.state == "CA"}
    puts "There are #{c} zip code matches in California"
  end

  def zip_info
    print "Enter zip: "
    zip = gets.strip.to_i
    zips = @areas.select { |a| a.zipcode == zip }
    unless zips.empty?
      puts ""
      zips.each { |z| puts z }
    else
      puts "Zip not found"
    end
  end
end