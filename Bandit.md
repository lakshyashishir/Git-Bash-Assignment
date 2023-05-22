## Bandit

## Level 0

```bash
#password is bandit0
cat readme
```

## Level 1

```bash
#NH2SXQwcBdpmTEzi3bvBHMM9H66vVXjL
cat ./-
```

## Level 2

```bash
#rRGizSaX8Mk1RTb1CNQoXTcYZWU6lgzi
cat spaces\ in\ this\ filename
```

## Level 3

```bash
#aBZ0W5EmUfAf7kHTQeOwd8bauFJ2lAiG
cd inhere
ls -a
cat .hidden
```

## Level 4

```bash
#2EW7BBsr6aMMoJ2HjW067dm8EgX26xNe
cd inhere
ls -a
cat ./-file07
```

## Level 5

```bash
#lrIWWI6bB37kxfiCQZqUdOIYfr6eEeqR
cd inhere
find . -type f -size 1033c ! -executable
cat ./maybehere07/.file2
```

## Level 6

```bash
#P4L4vucdmLnm8I7Vl7jG1ApGSfjYKqJU
find f -user bandit7 -group bandit6 -size 33c 2>/dev/null
cat /var/lib/dpkg/info/bandit7.password
```

## Level 7

```bash
#z7WtoNQU2XfjmMtWA8u5rN4vzqu4v99S
cat data.txt | grep "millionth"
```

## Level 8

```bash
#TESKZC0XvTetK0S9xNwm25STk5iWrBvP
cat data.txt | sort | uniq -u
```

## Level 9

```bash
#EN632PlfYiZbn3PhVK3XOGSlNInNE00t
strings data.txt | grep '='
```

## Level 10

```bash
#G7w8LIi6J3kTb8A7j9LgrywtEUlyyp6s
cat data.txt | base64 -d
```

## Level 11

```bash
#6zPeziLdR2RKNdNYFNb6nVCKzphlXHBM
cat data.txt|tr 'A-Za-z' 'N-ZA-Mn-za-m'
```

## Level 12

```bash
#JVNBBFSmZwKKOP0XbFXOoW8chDz5yVRv
mkdir /tmp/check
cp data.txt /tmp/check
cd /tmp/check

file data.txt
xxd -r data.txt > data

# Now repeat the process :

# file data

# mv data data.gz  gzip file
# gizp -d data.gz decompress

# mv data data.bz2  bzip2 file
# bzip2 -d data.bz2 decompress

# mv data data.tar  tar file
# tar -xvf data.tar decompress

cat data
```

## Level 13

```bash
#wbWdlBxEir4CaE8LaPhauuOo6pwRmrDw
ssh sshkey.private -i bandit14@localhost -p2220
cat /etc/bandit_pass/bandit14
```

## Level 14

```bash
#fGrHPx402xGC7U7rXKDaxiWFTOiF0ENq
telnet localhost 30000
```

## Level 15

```bash
#jN2kgmIXJ6fShzhT2avhotn4Zcka6tnt
openssl s_client -connect localhost:30001
```

## Level 16

```bash
#JQttfApK4SeyHwDlI9SXGR50qclOAil1
nmap localhost -p 31000-32000
# It will show 5 open ports, try connect each of them
ncat --ssl localhost 31790
# Use the current level flag, It will provide RSA PRIVATE Key

mkdir tmp/check
cd /tmp/check
touch key17.private
nano key17.private # save key here

chmod 600 key17.private 
ssh -i key17.private bandit17@bandit.labs.overthewire.org -p 2220
```

## Level 17

```bash
diff password.new password.old
```

## Level 18

```bash
#hga5tuuCLF6fFzUpnagiMN8ssu9LFrdg
ssh bandit18@bandit.labs.overthewire.org -p 2220 cat readme
```

## Level 19

```bash
#awhqfNnAbc1naukrpqDYcF95h7HoMTrC
./bandit20-do cat /etc/bandit\_pass/bandit20
```

