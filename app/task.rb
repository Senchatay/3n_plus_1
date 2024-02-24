# frozen_string_literal: true

# This module implements the Collatz Conjecture, also known as the 3n + 1 problem.
# The Collatz Conjecture states that for any natural number n,
# if it is even, divide it by 2, and if it is odd, multiply it by 3 and add 1.
# Repeat this process with the resulting number, and eventually, you will reach 1.
module Task
  module_function

  def description
    <<~TEXT
      Берём любое натуральное число n.
      Если оно чётное, то делим его на 2, а если нечётное, то умножаем на 3 и прибавляем 1 (получаем 3n + 1).
      Над полученным числом выполняем те же самые действия, и так далее.
      Гипотеза Коллатца заключается в том, что какое бы начальное число n мы ни взяли, рано или поздно мы получим единицу.
    TEXT
  end

  def max_from_slice(slice)
    calculate_slice(slice).sort_by do |_number, length|
      length
    end.last(20)
  end

  def calculate_slice(slice)
    slice.map do |number|
      [number, calculate(number)]
    end
  end

  def calculate(number)
    return unless number.is_a?(Integer)

    itteration = 0
    loop do
      return itteration if number <= 1

      itteration += 1
      number = next_node(number)
    end
  end

  def next_node(number)
    if number.even?
      number / 2
    else
      3 * number + 1
    end
  end
end
