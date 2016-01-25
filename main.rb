require_relative 'lib/menu'

#Input: text file with target price and available menu items
#Output: All combinations that match target price exactly

#Prompt user for menu file/location
puts 'Please enter the relative filename containing your menu text: '
customer_menu = gets.chomp

#Return combinations that match text file target
menu_list = Menu.new(customer_menu)
puts menu_list.show_combos