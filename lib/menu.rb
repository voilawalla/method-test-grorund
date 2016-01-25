class Menu

  attr_accessor :target_price, :items, :combinations

  def initialize(csv_file = nil)
    @target_price = 0
    @items        = []
    self.populate_data!(csv_file) if csv_file
  end

  def populate_data!(csv_file)
    self.items = []
    File.open(csv_file).each_with_index do |line, index|
      if index == 0
        self.target_price = parse_price(line)
      else
        item    = line.split(',')
        item[1] = parse_price(item[1])
        item    = {name: item[0], price: item[1]}
        self.items << item
      end
    end
    self.get_combos
    return self
  end

  def parse_price(price)
  	price.gsub!(' ', '')
  	(price.gsub!('$', '').to_f*100.to_i)
  end

  def get_combos
    @combinations = []
    
    #Check to see if multiples of any one item == @target price
    (0...(@items.count)).each do |item_index|
      if (@target_price % @items[item_index][:price]) == 0
        quatity = 0
        until ( @items[item_index][:price] * quatity ) == @target_price
          quatity = quatity + 1
        end
        @combinations << [@items[item_index]]*quatity
      end

    #  #Now check for combinations
    # (1...(@items.count)).each do |count|
    #     @items.combination(count).to_a.each do |combo_addition|
    #       @combinations << combo_addition if combo_addition.map{|x| x[:price]}.inject(:+) == @target_price
    #     end
    # end
    end

  end

  def show_combos
    results = ""
    if (@combinations != [])
    results << "You are in luck. Here are your #{@combinations.count} winning menu combinations\n"
      @combinations.each do |x|
        x.each{|y|results << y[:name] + "\n"}
        results << "==========\n"
      end
    else
    results << "Unfortunately, we can't make anything happen with the current menu and budget. Apologies.\n"
    end
    results
  end

end