## Extract Cygwin Package List

```bash
cygcheck -c -d | sed -e "1,2d" -e 's/ .*$//' > packagelist.csv
```

## Upload Cygwin Package List

```bash
./setup-x86_64 -P `awk 'NR==1{printf $1}{printf ",%s", $1}' packagelist.csv`
```

## Source

All of these steps are the result of this fantastic [site](http://blag.nullteilerfrei.de/2014/01/31/import-and-export-cygwin-list-of-installed-packages/).