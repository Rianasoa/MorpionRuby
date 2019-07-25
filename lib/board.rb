$:.unshift(File.expand_path'/home/dev/Documents/THP5/MorpionRuby/lib', __FILE__)
require 'application'
require 'board_case'
require 'game'
require 'player'
require 'show'

class Board
  #TO DO : la classe a 1 attr_accessor : un array/hash qui contient les BoardCases.
  #Optionnellement on peut aussi lui rajouter un autre sous le nom @count_turn pour compter le nombre de coups joué
  attr_accessor :rows_array


  def initialize
    #TO DO :
    #Quand la classe s'initialize, elle doit créer 9 instances BoardCases
    #Ces instances sont rangées dans un array/hash qui est l'attr_accessor de la classe
    @a1 = BoardCase.new("1")
    @a2 = BoardCase.new("2")
    @a3 = BoardCase.new("3")
    @b1 = BoardCase.new("4")
    @b2 = BoardCase.new("5")
    @b3 = BoardCase.new("6")
    @c1 = BoardCase.new("7")
    @c2 = BoardCase.new("8")
    @c3 = BoardCase.new("9")
    @rows_array = [
      [@a1, @a2, @a3],
      [@b1, @b2, @b3],
      [@c1, @c2, @c3]
    ]
    @all_board_cases = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]


  end

  def play_turn(player)
    #TO DO : une méthode qui :
    #1) demande au bon joueur ce qu'il souhaite faire

    puts "#{player.name}, que veux-tu jouer, choisis le numéro de case entre 1 à 9?"
    print "> "
    player_case = gets.chomp.upcase
    while !@all_board_cases.include?(player_case) # on teste si la case est disponible
      puts "Choisis une autre case qui n'est pas encore cochée"
      print "> "
      player_case = gets.chomp.upcase
    end

    #2) change la BoardCase jouée en fonction de la valeur du joueur (X ou O)

    case player_case

    when "1"
      @a1.state = player.sign
      @all_board_cases.delete("1")
    when "2"
      @a2.state = player.sign
      @all_board_cases.delete("2")
    when "3"
      @a3.state = player.sign
      @all_board_cases.delete("3")
    when "4"
      @b1.state = player.sign
      @all_board_cases.delete("4")
    when "5"
      @b2.state = player.sign
      @all_board_cases.delete("5")
    when "6"
      @b3.state = player.sign
      @all_board_cases.delete("6")
    when "7"
      @c1.state = player.sign
      @all_board_cases.delete("7")
    when "8"
      @c2.state = player.sign
      @all_board_cases.delete("8")
    when "9"
      @c3.state = player.sign
      @all_board_cases.delete("9")

    end


  end

  def victory?(player, status)
    #TO DO : une méthode qui vérifie le plateau et indique s'il y a un vainqueur ou match nul

    if (@a1.state == @a2.state) && (@a2.state == @a3.state) && (@a1.state != "_")
        puts "#{player.name} a gagné!\n"
        return true
      elsif (@b1.state == @b2.state) && (@b2.state == @b3.state) && (@b1.state != "_")
        puts "#{player.name} a gagné!\n"
        return true
      elsif (@c1.state == @c2.state) && (@c2.state == @c3.state) && (@c1.state != "_")
        puts "#{player.name} a gagné!\n"
        return true
      elsif (@a1.state == @b1.state) && (@b1.state == @c1.state) && (@a1.state != "_")
        puts "#{player.name} a gagné!\n"
        return true
      elsif (@a2.state == @b2.state) && (@b2.state == @c2.state) && (@a2.state != "_")
        puts "#{player.name} a gagné!\n"
        return true
      elsif (@a3.state == @b3.state) && (@b3.state == @c3.state) && (@a3.state != "_")
        puts "#{player.name} a gagné!\n"
        return trueplayer
      elsif (@a1.state == @b2.state) && (@b2.state == @c3.state) && (@a1.state != "_")
        puts "#{player.name} a gagné!\n"
        return true
      elsif (@a3.state == @b2.state) && (@b2.state == @c1.state) && (@a3.state != "_")
        puts "#{player.name} a gagné!\n"
        return true

      else
      end

  end
end