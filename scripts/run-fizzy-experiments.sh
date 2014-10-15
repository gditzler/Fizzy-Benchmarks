#!/usr/bin/env bash


cores=20
boots=250
nsel=50

echo "Running MIM; AG-SEX"
fizzy -l SEX -f MIM -i ../../DataCollections/AmericanGut/AmericanGut-Gut-Sex.biom  \
  -m ../../DataCollections/AmericanGut/AmericanGut-Gut-Sex.txt \
  -o ../outputs/AmericanGut-Gut-Sex-Results-Fizzy-MIM.txt -n ${nsel} -s

echo "Running JMI; AG-SEX"
fizzy -l SEX -f JMI -i ../../DataCollections/AmericanGut/AmericanGut-Gut-Sex.biom \
  -m ../../DataCollections/AmericanGut/AmericanGut-Gut-Sex.txt \
  -o ../outputs/AmericanGut-Gut-Sex-Results-Fizzy-JMI.txt -n ${nsel} -s

echo "Running NPFS-MIM; AG-SEX"
npfs -l SEX -f MIM -i ../../DataCollections/AmericanGut/AmericanGut-Gut-Sex.biom \
  -m ../../DataCollections/AmericanGut/AmericanGut-Gut-Sex.txt -o tmp.txt \
  -n ${nsel} -c ${cores} -b ${boots} -s -r ../outputs/AmericanGut-Gut-Sex-Results-NPFS-MIM.biom

cat tmp.txt | sed -e "s/[a-z]\_\_//g" -e "s/,,//g" -e 's/,\t/\t/g' > ../outputs/AmericanGut-Gut-Sex-Results-NPFS-MIM.txt
rm tmp.txt


echo "Running NPFS-JMI; AG-SEX"
npfs -l SEX -f JMI -i ../../DataCollections/AmericanGut/AmericanGut-Gut-Sex.biom \
  -m ../../DataCollections/AmericanGut/AmericanGut-Gut-Sex.txt -o tmp.txt -n ${nsel} \
  -c ${cores} -b ${boots} -s -r ../outputs/AmericanGut-Gut-Sex-Results-NPFS-JMI.biom

cat tmp.txt | sed -e "s/[a-z]\_\_//g" -e "s/,,//g" -e 's/,\t/\t/g' > ../outputs/AmericanGut-Gut-Sex-Results-NPFS-JMI.txt
rm tmp.txt


echo "Running MIM; AG-DIET"
fizzy -l DIET_TYPE -f MIM -i ../../DataCollections/AmericanGut/AmericanGut-Gut-Diet-OmniVegan.biom \
  -m ../../DataCollections/AmericanGut/AmericanGut-Gut-Diet-OmniVegan.txt \
  -o ../outputs/AmericanGut-Gut-Diet-OmniVegan-Results-Fizzy-MIM.txt -n ${nsel} -s

echo "Running JMI; AG-DIET"
fizzy -l DIET_TYPE -f JMI -i ../../DataCollections/AmericanGut/AmericanGut-Gut-Diet-OmniVegan.biom \
  -m ../../DataCollections/AmericanGut/AmericanGut-Gut-Diet-OmniVegan.txt \
  -o ../outputs/AmericanGut-Gut-Diet-OmniVegan-Results-Fizzy-JMI.txt -n ${nsel} -s


echo "Running NPFS-MIM; AG-DIET"
npfs -l SEX -f MIM \
  -i ../../DataCollections/AmericanGut/AmericanGut-Gut-Diet-OmniVegan.biom \
  -m ../../DataCollections/AmericanGut/AmericanGut-Gut-Diet-OmniVegan.txt -o tmp.txt \
  -n ${nsel} -c ${cores} -b ${boots} -s -r ../outputs/AmericanGut-Gut-Diet-OmniVegan-Results-NPFS-MIM.biom

cat tmp.txt | sed -e "s/[a-z]\_\_//g" -e "s/,,//g" -e 's/,\t/\t/g' > ../outputs/AmericanGut-Gut-Diet-OmniVegan-Results-NPFS-MIM.txt
rm tmp.txt

echo "Running NPFS-JMI; AG-DIET"
npfs -l SEX -f JMI \
  -i ../../DataCollections/AmericanGut/AmericanGut-Gut-Diet-OmniVegan.biom \
  -m ../../DataCollections/AmericanGut/AmericanGut-Gut-Diet-OmniVegan.txt -o tmp.txt \
  -n ${nsel} -c ${cores} -b ${boots} -s -r ../outputs/AmericanGut-Gut-Diet-OmniVegan-Results-NPFS-JMI.biom

cat tmp.txt | sed -e "s/[a-z]\_\_//g" -e "s/,,//g" -e 's/,\t/\t/g' > ../outputs/AmericanGut-Gut-Diet-OmniVegan-Results-NPFS-JMI.txt
rm tmp.txt

echo "Running MIM; Caporaso-Sex"
fizzy -l SEX -f MIM -i ../../DataCollections/Caporaso/caporaso-gut.biom \
  -m ../../DataCollections/Caporaso/caporaso-gut.txt -o ../outputs/caporaso-gut-Results-Fizzy-MIM.txt \
  -n ${nsel} -s

echo "Running JMI; Caporaso-Sex"
fizzy -l SEX -f JMI -i ../../DataCollections/Caporaso/caporaso-gut.biom \
  -m ../../DataCollections/Caporaso/caporaso-gut.txt \
  -o ../outputs/caporaso-gut-Results-Fizzy-JMI.txt -n ${nsel} -s

echo "Running NPFS-MIM; Caporaso-Sex"
npfs -l SEX -f MIM -i ../../DataCollections/Caporaso/caporaso-gut.biom \
  -m ../../DataCollections/Caporaso/caporaso-gut.txt -o tmp.txt -n ${nsel} -c ${cores} \
  -b ${boots} -s -r ../outputs/caporaso-gut-Results-NPFS-MIM.biom

cat tmp.txt | sed -e "s/[a-z]\_\_//g" -e "s/,,//g" -e 's/,\t/\t/g' > ../outputs/caporaso-gut-Results-NPFS-MIM.txt
rm tmp.txt

echo "Running NPFS-JMI; Caporaso-Sex"
npfs -l SEX -f JMI -i ../../DataCollections/Caporaso/caporaso-gut.biom \
  -m ../../DataCollections/Caporaso/caporaso-gut.txt -o tmp.txt \
  -n ${nsel} -c ${cores} -b ${boots} -s -r ../outputs/caporaso-gut-Results-NPFS-JMI.biom

cat tmp.txt | sed -e "s/[a-z]\_\_//g" -e "s/,,//g" -e 's/,\t/\t/g' > ../outputs/caporaso-gut-Results-NPFS-JMI.txt
rm tmp.txt
