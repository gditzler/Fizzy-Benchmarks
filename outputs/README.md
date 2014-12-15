```bash 
cat AmericanGut-Gut-Diet-OV-Results-Fizzy-JMI.txt  | awk -F '\t' '{d=$3-$6; print $1,sprintf("%.9f", d) }' >> AmericanGut-Gut-Diet-OV-Results-Fizzy-JMI-diff.txt
cat -n AmericanGut-Gut-Diet-OV-Results-Fizzy-JMI.txt | tr -d ' ' | awk -F '\t' '{d=$4-$7; if (d >= 0) {print $1,$2 ($3),sprintf("%.9f", d),"p";}else{print $1,$2 ($3),sprintf("%.9f", -d),"n";} }' | sort -k3 -nr | head -15 | sed -e "s/k\_\_Bacteria,//g" -e "s/[a-z]\_\_//g"
```
