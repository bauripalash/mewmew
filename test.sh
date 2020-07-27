#!/bin/sh

# Error Counter
e=0

echo "---  Starting Test  ---"
echo "======================="
echo ""


# Example 1


if ./mewmew examples/scratch.mew.txt | grep -q '300'; then
    echo "[-] PASS => 1"
else
    echo "[x] FAIL => 1"
    e=1
fi


# Example 2


if ./mewmew examples/adddiv.mew.txt | grep -qzP '2\n4\n6\n8\n10'; then
    echo "[-] PASS => 2"
else
    echo "[x] FAIL => 2"
    e=1
fi


# Example 3


if ./mewmew examples/factorial.mew.txt | grep -q '120'; then
    echo "[-] PASS => 3"
else
    echo "[x] FAIL => 3"
    e=1
fi

# Example 4


if echo "10" | ./mewmew examples/stdin.mew.txt | grep -q '1e+10'; then
    echo "[-] PASS => 4"
else
    echo "[x] FAIL => 4"
    e=1
fi

# Example 5


if ./mewmew examples/helloworld.mew.txt | grep -q 'HELLO WORLD'; then
    echo "[-] PASS => 5"
else
    echo "[x] FAIL => 5"
    e=1
fi

echo ""
echo "---  Ending Test  ---"
echo "====================="

if [ "$e" -gt 0 ]; then
    exit 1
fi
