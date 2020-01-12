
echo "Please enter a name"
read name

if ! [[ -z "$name" ]]; then
  echo "One for $name, one for me."
else
  echo "One for you, one for me."
fi
