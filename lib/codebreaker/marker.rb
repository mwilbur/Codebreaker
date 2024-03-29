class Marker
  def initialize(secret, guess)
    @secret = secret.split('').freeze
    @guess = guess.split('').freeze
  end

  def exact_match?(position)
    @guess[position] == @secret[position]
  end

  def number_match?(position)
    @secret.include?(@guess[position]) && !exact_match?(position)
  end

  def exact_match_count()
    (0..3).inject(0) do |count, index|
      count += 1 if exact_match?(index)
      count
    end
  end

  def number_match_count()
    total_match_count - exact_match_count
=begin
    (0..3).inject(0) do |count, index|
      count += 1 if number_match?(index)
      count
    end
=end
  end

  def total_match_count()
    count = 0
    scratch = @secret.dup
    @guess.each do |n|
      if scratch.include?(n)
        scratch.delete_at(@secret.index(n))
        count += 1
      end
    end
    count
  end

end
