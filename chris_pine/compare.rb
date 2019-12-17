i_am_chris = true
i_am_purple = false
i_like_beer = true
i_eat_rocks = false

puts i_am_chris && i_like_beer #true
puts i_like_beer && i_eat_rocks #false
puts i_am_purple && i_like_beer #false
puts i_am_purple && i_eat_rocks #false
puts
puts i_am_chris || i_like_beer #true
puts i_like_beer || i_eat_rocks #true
puts i_am_purple || i_like_beer #true
puts i_am_purple || i_eat_rocks #false
puts
puts !i_am_purple #true
puts !i_am_chris #false
