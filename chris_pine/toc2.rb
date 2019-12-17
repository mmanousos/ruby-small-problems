dis = 50
space = ''
toc = "table of contents".capitalize
ch1 = "Chapter 1:  Getting Started"
ch1_pg = "page 1"
ch2 = "Chapter 2:  Numbers"
ch2_pg = "page 9"
ch3 = "Chapter 3:  Letters"
ch3_pg = "page 13"

format = [toc, ch1, ch1_pg, ch2, ch2_pg, ch3, ch3_pg]

puts format[0].center(dis)
puts (space.ljust(dis/6) + format[1].ljust(dis/3) + format[2].rjust(dis/2))
puts (space.ljust(dis/6) + format[3].ljust(dis/3) + format[4].rjust(dis/1.5))
puts (space.ljust(dis/6) + format[5].ljust(dis/3) + format[6].rjust(dis/1.5))

# practice using centering + left and right margins
