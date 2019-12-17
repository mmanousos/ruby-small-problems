Write a program that can calculate the Hamming distance between two DNA strands.

A mutation is simply a mistake that occurs during the creation or copying of a nucleic acid, in particular DNA. Because nucleic acids are vital to cellular functions, mutations tend to cause a ripple effect throughout the cell. Although mutations are technically mistakes, a very rare mutation may equip the cell with a beneficial attribute. In fact, the macro effects of evolution are attributable by the accumulated result of beneficial microscopic mutations over many generations.

The simplest and most common type of nucleic acid mutation is a point mutation, which replaces one base with another at a single nucleotide.

By counting the number of differences between two homologous DNA strands taken from different genomes with a common ancestor, we get a measure of the minimum number of point mutations that could have occurred on the evolutionary path between the two strands.

This is called the 'Hamming distance'

GAGCCTACTAACGGGAT
CATCGTAATGACGGCCT
^ ^ ^  ^ ^    ^^
The Hamming distance between these two DNA strands is 7.

The Hamming distance is only defined for sequences of equal length. If you have two sequences of unequal length, you should compute the Hamming distance over the shorter length.

Problem
given two strings compare whether they are identical, counting the differences at each character and returning the number of differences.

if one string is shorter, only compare that length of the other string.

if strand1 is shorter, trim strand2
if strand2 is shorter, trim strand1

check if length of strand1 is == length of strand2
determine shorter string


Example / Tests
GAGCCTACTAACGGGAT, CATCGTAATGACGGCCT == 7

Data Structure


Algorithm
BEGIN

SET size1 = strand1.length
SET size2 = strand2.length
compare = size1 <=> size2
return if compare.zero?
if compare == -1 # (strand 2 is longer)
  strand2 = strand2.slice(0, size1)
else (strand 1 is longer)
  strand1 = strand1.slice(0, size2)
end



iterate over one strand with index. count if same index of second strand == 

END
