apt update
cat ./packages.txt | xargs apt -y install
