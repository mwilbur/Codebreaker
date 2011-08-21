class Marker
  def initialize(secret, guess)
    @secret = secret
    @guess = guess
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
    (0..3).inject(0) do |count, index|
      count += 1 if number_match?(index)
      count
    end
  end
end
