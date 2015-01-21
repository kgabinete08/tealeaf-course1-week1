puts "This is a simple calculator."

begin
puts "Please enter the first number."
first_number = gets.chomp

puts "Please enter the second number"
second_number = gets.chomp

puts "Please choose an operation: add, subtract, divide or multiply."
operator = gets.chomp.downcase

case operator
  when 'add'
    puts first_number.to_i + second_number.to_i
  when 'subtract'
    puts first_number.to_i - second_number.to_i
  when 'multiply'
    puts first_number.to_i * second_number.to_i
  when 'divide'
    if second_number == '0'
      puts "You cannot divide by zero."
    else
      puts first_number.to_f / second_number.to_i
    end
  else
  puts "That is not a valid command."
end
  puts "Would you like to perform another calculation? (Y/N)"
  answer = gets.chomp.upcase
end while answer == 'Y'