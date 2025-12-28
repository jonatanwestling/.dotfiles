#!/bin/sh

quotes=(
  "Stay hard."
  "Callous the mind."
  "No one is coming."
  "Earn your place."
  "Comfort is the enemy."
  "Be uncommon."
  "What if?"
  "TAKING SOULS."
  "Be uncommon amongst the uncommon."
  "Don't stop when you're tired. Stop when you're done."
)

index=$((RANDOM % ${#quotes[@]}))
echo "${quotes[$index]}"
