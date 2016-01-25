# class Menu

# 	attr_accessor :target_price, :items, :combinations

# 	def initialize(csv_file = nil)
# 		@target_price = 0
# 		@items = []
# 		self.populate_data!(csv_file) if csv_file
# 	end

# 	def parse_price(price)
# 		price.gsub!(' ', '')
# 		(price.gsub!('$', '').to_f*100).to_i
# 	end

# 	def populate_data!(csv_file)
# 		self.items = []
# 		File.open(csv_file).each_with_index do | line, index |
# 			if index == 0
# 				self.target_price = parse_price(line)
# 			else
# 				item = line.split(',')
# 				item[1] = parse_price(item[1])
# 				item = {name: item[0], price: item[1]}
# 				self.items << item
# 			end
# 		end
# 		self.get_combos
# 		return self
# 	end

# 	def get_combo
# 		@combinations = []
# 		(1...(@items.count)).each do | count |
# 			@items.combination(count).to_a each do | combo_nominee |
# 				@combinations << combo_nominee if combo_nominee.map{ |x| x[:price]}.
# 				inject(:+) == @target_price

# 			end









