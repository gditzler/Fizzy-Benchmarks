```bash 
cat AmericanGut-Gut-Diet-OmniVegan-Results-Fizzy-JMI.txt  | awk -F '\t' '{d=$3-$4; if (d >= 0) {print $1,sprintf("%.9f", d);}else{print $1,sprintf("%.9f", -d);} }' | sort -k2 -nr | less
```
