module Loggable

  def log(title,e)
    return

    if Application.environment.to_s == "development"
      return
    end

    puts "\n"
    puts "----------------------------------------------------------------\n"
    puts "#{title}\n"
    puts "----------------------------------------------------------------\n"
    puts "\n"
    puts e.message
    puts e.backtrace.join("\n")
    puts "\n"
    puts "----------------------------------------------------------------\n"
    puts "\n"
  end

end
