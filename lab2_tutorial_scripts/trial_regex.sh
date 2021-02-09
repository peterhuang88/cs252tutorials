#!/bin/bash

STRINGFILE=$1

# match a single character in brackets
# so if it finds any character in the brackets in MYSTRING
# it'll print 
if egrep -q [o] $STRINGFILE ; then
	echo "found an o"
fi

# matches a range of lowercase characters
# works for both upper case and numbers
if egrep -q [a-z] $STRINGFILE ; then
	echo "found some lowercase character"
fi

# you can also recognize special characters
# note that you might have to escape some characters like the plus here
if egrep -q [#$/+] $STRINGFILE ; then
	echo "found a special character"
fi

# the + here matches one or more of the pattern its attached to
# so here, it's looking for 1 or more a's
if egrep -q [a]+ $STRINGFILE ; then
	echo "found 1 or more a's"
fi

# same concept as + but this time matches 0 or more
if egrep -q [a]* $STRINGFILE ; then
	echo "found 0 or more a's"
fi

# BACKREFERENCES
# matches a digit first
# the \1+ then matches the previous regex (so the SAME DIGIT)
# and then matches 1 or more
if egrep -q "([0-9])(\1)+" $STRINGFILE ; then
	echo "found repeating digit"
fi
