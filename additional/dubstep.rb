=begin
*assignment*
Polycarpus works as a DJ in the best Berland nightclub, and he often uses
dubstep music in his performance. Recently, he has decided to take a couple of
old songs and make dubstep remixes from them.

Let's assume that a song consists of some number of words. To make the dubstep
remix of this song, Polycarpus inserts a certain number of words "WUB" before
the first word of the song (the number may be zero), after the last word (the
number may be zero), and between words (at least one between any pair of
neighbouring words), and then the boy glues together all the words, including
"WUB", in one string and plays the song at the club.

For example, a song with words "I AM X" can transform into a dubstep remix as "
WUBWUBIWUBAMWUBWUBX" and cannot transform into "WUBWUBIAMWUBX".

Recently, Jonny has heard Polycarpus's new dubstep track, but since he isn't
into modern music, he decided to find out what was the initial song that
Polycarpus remixed. Help Jonny restore the original song.

*problem*
Input:
The input consists of a single non-empty string, consisting only of uppercase
English letters, the string's length doesn't exceed 200 characters

- string of all uppercase letters with the word WUB contained in it mutiple times

Output:
Return the words of the initial song that Polycarpus used to make a dubsteb
remix. Separate the words with a space.

- string of all uppercase letters, words separated by spaces

break string using split('WUB') as the delimiter
remove any extra spaces using reject!
join the string with spaces and return

*examples / test cases *
song_decoder("WUBWEWUBAREWUBWUBTHEWUBCHAMPIONSWUBMYWUBFRIENDWUB")
  #  =>  WE ARE THE CHAMPIONS MY FRIEND

*data structures*
string to array to string

*algorithm*
BEGIN
  declare a method that accepts one string as an argument
    array = split string using 'WUB' as a delimiter
    WHILE elements remain in the array to evaluate
      SET array = array.reject! { |substr| substr == "" }
      string = array.join(' ')
END
=end

def song_decoder(song)
  song.split('WUB').select { |lyric| lyric != "" }.join(' ')
end

p song_decoder("AWUBBWUBC") == 'A B C'
p song_decoder("WUBWEWUBAREWUBWUBTHEWUBCHAMPIONSWUBMYWUBFRIENDWUB") == "WE ARE THE CHAMPIONS MY FRIEND"
p song_decoder("AWUBWUBWUBBWUBWUBWUBC") == "A B C"
p song_decoder("WUBAWUBBWUBCWUB") == "A B C"
