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
  "No excuses."
  "Lock in."
  "Be relentless."
  "Win the day."
)

index=$((RANDOM % ${#quotes[@]}))
echo "${quotes[$index]}"
