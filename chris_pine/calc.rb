dis = 50
toc = "table of contents".capitalize
space = ""
ch1 = "Chapter 1:  Getting Started"
ch1_pg = "page 1"
ch2 = "Chapter 2:  Numbers"
ch2_pg = "page 9"
ch3 = "Chapter 3:  Letters"
ch3_pg = "page 13"

puts toc.center(dis)
puts space
puts space
puts (space.ljust(dis/6) + ch1.ljust(dis/3) + ch1_pg.rjust(dis/2))
puts (space.ljust(dis/6) + ch2.ljust(dis/3) + ch2_pg.rjust(dis/1.5))
puts (space.ljust(dis/6) + ch3.ljust(dis/3) + ch3_pg.rjust(dis/1.5))
