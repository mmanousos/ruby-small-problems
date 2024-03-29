Simple Cipher
Implement a simple shift cipher like Caesar and a more secure substitution cipher.

Step 1:

"If he had anything confidential to say, he wrote it in cipher, that is, by so changing the order of the letters of the alphabet, that not a word could be made out. If anyone wishes to decipher these, and get at their meaning, he must substitute the fourth letter of the alphabet, namely D, for A, and so with the others."

— Suetonius, Life of Julius Caesar

Ciphers are very straight-forward algorithms that allow us to render text less readable while still allowing easy deciphering. They are vulnerable to many forms of cryptoanalysis, but we are lucky that generally our little sisters are not cryptoanalysts.

The Caeser Cipher was used for some messages from Julius Caesar that were sent afield. Now Caeser knew that the cipher wasn't very good, but he had one ally in that respect: almost nobody could read well. So even being a couple letters off was sufficient so that people couldn't recognize the few words that they did know.

Your task is to create a simple shift cipher like the Caesar Cipher. This image is a great example of the Caesar Cipher:

Caesar Cipher

Here are some examples:

@cipher = Cipher.new
@cipher.encode("iamapandabear") #=> "ldpdsdqgdehdu"
@cipher.decode("ldpdsdqgdehdu") #=> "iamapandabear"

Problem

`encode`
In: string without spaces, punctuation, or capitalization
Out: string with each letter shifted forward by 3 (a -> d, b -> e, etc.)

`decode`
In: string without spaces, punctuation, or capitalization
Out: string with each letter shifted back by 3 (d -> a, e -> b, etc.)

Questions: what happens at the edge of the alphabet? 
    for `encode`, do x, y, z wrap around to become a, b, c?
    for `decode`, do a, b, c wrap around to become x, y, z?
Assumptions: assume this wrapping behavior is required for now.
- also that string will not contain punctuation
Rules: argument error if there are uppercase letters, numbers (also may as well include punctuation or spaces)

Approach Brainstorming: 
iterate over the letters of the original string (each_char?)

`encode`
convert to ASCII value 
shift by + 3
convert back to letter

`decode`
convert to ASCII value
shift by - 3
convert back to letter

Algorithm
BEGIN
  argument error if argument includes anything but 'a-z'  
  split string into array of characters
  iterate over array of characters and map
    convert the character to ascii value
    add + 3
    convert back to letter and return new value
  join newly mapped array and return  
END


Step 2:

Shift ciphers are no fun though when your kid sister figures it out. Try amending the code to allow us to specify a key and use that for the shift distance. This is called a substitution cipher.

Here's an example:

@cipher = Cipher.new("aaaaaaaaaaaaaaaaaa")
@cipher.encode("iamapandabear") #=> "iamapandabear"
@cipher = Cipher.new("ddddddddddddddddd")
@cipher.encode("imapandabear") #=> "lpdsdqgdehdu"
In the example above, we've set a = 0 for the key value. So when the plaintext is added to the key, we end up with the same message coming out. So "aaaa" is not an ideal key. But if we set the key to "dddd", we would get the same thing as the Caesar Cipher.

Problem

`encode`
In: key and string
Out: encrypted string with each letter shifted the corresponding number of spaces according to its matching letter in the key
if encrypting string[1] and key[1] is 'd', increase by 3  

`decode`
In: key and string
Out: decrypted string with each letter shifted the corresponding number of spaces according to its matching letter in the key
if decrypting string[1] and key[1] is 'd', decrease by 3

Assumptions: wrap around key if string.length > key.length

Approach Brainstorming: 

Example / Tests 


Data Structure 


Algorithm
BEGIN

END



Step 3:

The weakest link in any cipher is the human being. Let's make your substitution cipher a little more fault tolerant by providing a source of randomness and ensuring that they key is not composed of numbers or capital letters.

If someone doesn't submit a key at all, generate a truly random key of at least 100 characters in length, accessible via Cipher#key (the # syntax means instance variable)

If the key submitted has capital letters or numbers, throw an ArgumentError with a message to that effect.

Some examples:

@cipher = Cipher.new
@cipher.key #=> "duxrceqyaimciuucnelkeoxjhdyduucpmrxmaivacmybmsdrzwqxvbxsygzsabdjmdjabeorttiwinfrpmpogvabiofqexnohrqu"
