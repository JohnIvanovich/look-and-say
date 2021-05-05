## Генератор последовательности ["Посмотри и скажи"](https://en.wikipedia.org/wiki/Look-and-say_sequence)

### Задача

Написать программу, которая генерирует такую последовательность

__использование__

```ruby
require './lib/lns_generator'

generator = LNSGenerator.new('1112')
puts generator.next # outputs "3112"

LNSGenerator.new('1').take(6) do |k|
  puts k
end
# outputs:
#  1
#  11
#  21
#  1211
#  111221
#  312211
```

__запуск тестов__

```bash
$ ruby test/*
```
или

```bash
make test
```
