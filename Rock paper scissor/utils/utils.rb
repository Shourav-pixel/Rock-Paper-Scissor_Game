def validate_arguments(args)
    length = args.length
    is_error = length < 3 || length.even? || args.uniq.size != length
    if is_error
      puts 'Invalid arguments! Please provide an odd number of unique moves.'
      puts 'Example: ruby game.rb rock paper scissors'
    end
    !is_error
  end
  