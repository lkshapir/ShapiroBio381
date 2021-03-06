---
title: "HW#3"
author: "Lily Shapiro"
date: "1/29/2020"
output: html_document
---
**Regular Expressions**

**1.**

*Find*

```
\s{2,}
```
To find 2 or more consecutive spaces between words

*Replace*

```
,
```
To insert a comma between each word 

**2.**

*Find*
```
(\w+), (\w+), (.*)
```
To identify the first two words and the comma between them, and identify the rest of the phrase after the second comma

*Replace*
```
$2 $1 ($3)

```
To switch the first two words, and add parentheses to the third section 

**3.**

*Find*
```
(mp3)(\s)
```
To capture the mp3 portion of the sentence, along with the space afterwords

*Replace*
```
($1\n)
```
To keep the mp3, while replacing the space afterwords with a line break 

**4.** 

*Find*
```
(\d{4})\s(.*)(.mp3)
```
To find the numbers with four digits each, the space between the numbers and the words, words in the middle, and the .mp3 extension 

*Replace*
```
($2$1_$3)
```
Switches the first and second terms, and adds an underscore after the number

**5.** 

*Find*
```
(\w)\w+,(\w+),(.*),(\d+)
```
Found the first digit of each genus,found the full species name, the decimal number afterwords, and the number at the end of the line

*Replace*
```
$1_$2,$4
```
Replaced the full genus name with a single letter (with an underscore afterwords), followed by the end number

**6.**

*Find*
```
(\w_)(\w{4})(\w*),(\d+)
```
Found the first four letters of each of the species names, the extra wording in the name (post primary 4) and the number at the end of the line

*Replace*
```
$1_$2,$4
```
Replaced species name with abbreviation of 4 letters, conserved numbers at end of line 

**7.**

*Find*
```
(\w{3})(\w*),(\w{3})(\w*),(\d+.\d),(\d+)
```
Found first three letters in the first word, along with identifying the remainder of the full species name. Next, found first three letters of second word, along with identifying the decimal number in the middle, and the number at the end of the line

*Replace*

```
$1$3, $6, $5
```
Tied together the first three letters of the species and genus name, erasing the extra letters that followed in each. Switched the position of each of the two number sets. 