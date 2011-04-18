class Pry
  DEFAULT_PRINT = proc do |output, value|
    if Pry.color
      begin
        output.puts "=> #{value.awesome_inspect({})}"
      rescue NoMethodError
        output.puts "=> (unknown)"
      end
    else
      output.puts "=> #{Pry.view(value)}"
    end
  end

  # Will only show the first line of the backtrace
  DEFAULT_EXCEPTION_HANDLER = proc do |output, exception|
    output.puts "#{exception.class}: #{exception.message}"
    output.puts "from #{exception.backtrace.first}"
  end
end

