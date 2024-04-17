earnings = 11
special_value = 12

case earnings do
  10 -> "too less, work harder!"
  ^special_value -> "that's right man, keep it up. You earned #{special_value}"
  salary when salary > 12 -> "you earn #{salary} you are too rich"
  _ -> "you are underpaid"
end
