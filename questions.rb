class Questions
  attr_accessor :random1, :random2, :answer

  def initialize()
    @random1 = rand(1..20)
    @random2 = rand(1..20)
    @answer = @random1 + @random2
  end

end


