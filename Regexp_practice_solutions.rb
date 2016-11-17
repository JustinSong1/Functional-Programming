##################################
  #Regular Expressions Practice
##################################

#For each regular expression below, describe what characters
#it will match. Also provide an example or two of a string
#of characters that would match the expression.

#1  /[a-m][n-z]/

  #Any character in the range a-m followed by any character in the range n-z.
  #Ex:   "bx"     would match at "bx"
  #Ex:   "123cz"  would match at "cz"

#2  /[aeiou]+4/

  #Any vowel (zero or one) followed by a 4
  #Ex:   "helloi4"  would match at "i4"
  #Ex:   "8a47bee"  would match at "a4"
  #Ex:   "4"        would match at "4"
  #Ex:   "123456"   would match at "4"
  #A zero or one match means that there can be zero of that character or one.

#3  /ed\z/

  #The letter e then the letter d followed by the end of the string.
  #Ex:   "ed"       would match at "ed"
  #Ex:   "tired"    would match at "ed"

#4  /.{4}-/

  #Any character four times (each of the four characters could be different)
  #followed by a '-'
  #Ex:  "sd24-"         would match at "sd24-"
  #Ex:  "asdeg56-w234"  would match at "eg56-"   

#5  /\.\.\d{3}t?/

  #A period followed by another period (\. means a literal period, not any character)
  #followed by three digits followed by zero or one 't'.
  #Ex:  "..137t"          would match at "..137t"
  #Ex:  "soe..954273"     would match at "..954"
  #Ex:  "123....492tttt"  would match at "..492t"

#6  /[^abcde]*/

  #Any character that is not 'a', 'b', 'c', 'd', or 'e' zero or more times. Each character can be
  #different as long as they are not 'a', 'b', 'c', 'd', or 'e'.
  #Ex:  "abcwr839sk"    would match at "wr839sk"
  #Ex:  "edc3abad"      would match at "3"

#7  /happy|sad/

  #The word happy or the word sad
  #Ex:  "happy birthday"      would match at "happy"
  #Ex:  "sad turtle is sad"   would match at "sad" in both cases

#8  /[a-z]{2,5}/

  #Any letter repeated between 2 and 5 times. Each letter can be different,
  #but there needs to be a string of 2 to 5 letters back to back.
  #Ex:  "abck"    would match at "abck"
  #Ex:  "rrrrr"   would match at "rrrrr"






