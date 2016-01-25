require 'menu'

describe Menu, '#new' do

  let(:menu_list) { Menu.new('menu.txt') }

  it 'populates a target price' do
    expect(menu_list.target_price).to eq(1505)
  end

  it 'populates fruit items' do
    expect(menu_list.items[0]).to eq({ name: 'mixed fruit', price: 215 })
    expect(menu_list.items[5]).to eq({ name: 'sampler plate', price: 580 })
  end
end

describe Menu, '#get_combos' do

  let(:possible_menuitem) { Menu.new('spec/combos_possible.txt') }
  let(:impossible_menuitem) { Menu.new('spec/no_combos_possible.txt') }
  let(:possible_combinations) { possible_menuitem.combinations }
  let(:impossible_combinations) { impossible_menuitem.combinations }

  it 'creates combinations' do
    expect(possible_combinations).to include([
      {:name=>'walnut', :price=>500},
      {:name=>'acorn', :price=>500}])
    expect(possible_combinations).to include([{:name=>'cashew', :price=>200},
                                              {:name=>'almond', :price=>800}])
    expect(impossible_combinations.count).to eq 0
  end
end

describe Menu, '#show_combos' do

  let(:winner) { Menu.new('spec/combos_possible.txt') }
  let(:loser) { Menu.new('spec/no_combos_possible.txt') }

  it 'shows the winning combinations' do
    expect(winner.show_combos).to include(
      'You are in luck. Here are your 5 winning menu combinations')
  end

  it 'notifies of impossible combinations' do
    expect(loser.show_combos).to include(
      'Unfortunately, we can\'t make anything happen'\
      ' with the current menu and budget. Apologies.')
  end

end
