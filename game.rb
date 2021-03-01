require_relative 'host'
require_relative 'question'
require_relative 'player'

class Game
  def initialize
    @host = Host.new
    @player1 = Player.new("Stephan")
    @player2 = Player.new("Christian")
    @current_player = nil
    @active_game = true
  end

  def start_game
    @host.speak("Welcome to Math Quiz!")
    @current_player = @player1

    while @active_game
      @host.speak("---New Question---")
      new_question = Question.new
      puts "Question for #{@current_player.name}: #{new_question.create_question}"
      if new_question.check_answer?(@host.input.to_i)
        @host.speak("Correct!")
        switch_players
        else
          @host.speak("Incorrect")
          @current_player.reduce_lives
          switch_players
      end
    end
  end

  private

  def switch_players
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end



end

game = Game.new
game.start_game
# p game
