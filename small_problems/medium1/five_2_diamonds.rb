# in: odd integer (n)
# out: printed diamond of n rows with n as the widest row

# AL:
# puts "*"
# with some amount of white spaces before that value depending on the row, in inverse relationship to its closeness to the widest row

# row 1 is 4 white space plus 1 "*"
# row 2 is 3 white spaces plus 3 "*"
# row 3 is 2 white spaces plus 5 "*"
# row 4 is 1 white space plus 7 "*"
# row 5 is 0 white space plus 9 "*"

# based on n, we generate 3 counters
# stars = 1
# rows = 1
# white spaces = n / 2

# row 1 = 1 star; each subsequent row gets + 2 until stars == n
#   then loop in reverse until rows == n

def generate_stars(spaces, stars)
  to_print = ''
  spaces.times { to_print << ' ' }
  stars.times { to_print << '*' }
  to_print
end

def diamond(n)
  stars = 1
  rows = 1
  spaces = n / 2

  while stars <= n
    puts generate_stars(spaces, stars)
    stars += 2
    spaces -= 1
    rows += 1
  end

  stars = n
  spaces = 0

  while rows <= n
    stars -= 2
    spaces += 1
    puts generate_stars(spaces, stars)
    rows += 1
  end

end

diamond(9)

# I'm sure there's a way to do it that doesn't require setting the stars & spaces before the second loop runs.
