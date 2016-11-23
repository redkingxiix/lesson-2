Kernel.puts("Hello! Welcome to the calculator program. Insert a number.")
first_number = Kernel.gets().chomp()
Kernel.puts("Insert another number.")
second_number = Kernel.gets().chomp()
Kernel.puts("Select an operator: 1) add, 2)subtract, 3)multiply, 4)divide")
operator = Kernel.gets().chomp()

if operator == "1"
  result = first_number.to_i() + second_number.to_i()
elsif operator == "2"
  result = first_number.to_i() - second_number.to_i()
elsif operator == "3"
  result = first_number.to_i() * second_number.to_i()
else
  result = first_number.to_i() / second_number.to_i()
end
Kernel.puts("The result is #{result}")
