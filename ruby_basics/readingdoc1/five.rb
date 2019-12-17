# 5. Large Numbers
# Using the ruby documentation, determine how you can write large numbers in a way that makes them easier to read.

using exponentation
e.g. 3e9 # 3 ** 9 or 3 to the 9th power or 19683
# found this in the forums not the core documentation but then also at https://ruby-doc.org/core-2.3.3/doc/syntax/literals_rdoc.html#label-Numbers

Also Bignum objects allow writing integers that would otherwise be too large.
# https://ruby-doc.org/core-1.9.3/Bignum.html

I also found that Ruby allows for placeholder underscores in numbers to make them easier to read.
e.g. 1_000_000_000 # interpreted the same as 10000000000 (1 billion) without any spaces.
# found this first in a github discussion but then also at https://ruby-doc.org/core-2.3.3/doc/syntax/literals_rdoc.html#label-Numbers
