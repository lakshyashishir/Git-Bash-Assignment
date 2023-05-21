# Git Exercises

## Ex.1 - master

```bash
git start master
```

## Ex.2 commit-one-file

```bash
git add A.txt #adds A.txt
git commit -m "Add A.txt" #Commit
```

## Ex.3 commit-one-file-staged

```bash
git reset B.txt #unstages B.txt
git commit -m "Unstage B.txt"
```

## Ex.4 ignore-them

```bash
touch .gitignore


##add following lines in gitignore file
## *.exe
## *.o
## *.jar
## libraries/


git add .gitignore
git commit -m "add gitignore"
```

## Ex.5 chase-branch

```bash
git merge escaped
```

## Ex.6 merge-conflict

```bash
git merge another-piece-of-work

#solve the conflict in the conflict editor
#replaced by 2 + 3 =5

git add equations.txt
git commit -m "merge-conflict"
git verify
```

## Ex.7 save-your-work

```bash
git stash
#fix bug in bug.txt

git add bug.txt
git commit -m "remove bug"

git stash pop

#add Finally, finished it! in last of bug.txt

git add .
git commit -m "save work"
git verify
```

## Ex.8 change-branch-history

```bash
git rebase hot-bugfix
git verify
```

## Ex.9 remove-ignored

```bash
git rm --cached ignored.txt
git commit -m "remove ignored.txt"
```

## Ex.10 case-sensitive-filename

```bash
git mv File.txt file.txt
git commit -m "change filename to lowercase"
```

## Ex.11 fix-typo

```bash
#edit the typo in the editor
git commit --amend
#change the commit
```

## Ex.12 forge-date

```bash
git commit --amend --no-edit --date="1987-04-30"
```

## Ex.13 fix old typo

```bash
git rebase -i HEAD~2
#make the first commit on the list editable change "pick" to "edit"
#fix typo
git add file.txt
git rebase --continue
#fix conflict

git add file.txt
git rebase --continue
```
## After every exercise :
## Git verify to check solution
## Git Start Next to start the next exercise