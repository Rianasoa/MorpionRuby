#ceci est le jeu. Cela initialise tout, lance une partie (avec une victoire ou un nul à la fin) permet de jouer un tour, de voir sir la partie est finie, etc.

$:.unshift(File.expand_path'/home/dev/Documents/THP5/MorpionRuby/lib', __FILE__)
require 'player'
require 'board'


class Game
  #TO DO : la classe a plusieurs attr_accessor: le current_player (égal à un objet Player), le status (en cours, nul ou un objet Player s'il gagne), le Board et un array contenant les 2 joueurs.

  attr_accessor :player, :status, :board, :array_players

  def initialize
    #TO DO : créé 2 joueurs, créé un board, met le status à "on going", défini un player
    @player1 = Player.new("Joueur 1")
    @player2 = Player.new("Joueur 2")
    @board = Board.new
    @player = @player1
    @array_players = [@player1, @player2]
    @status = "en cours"
    @count_turns = 0
    # @show = Show.new
  end

  def turn
    #TO DO : méthode faisant appelle aux méthodes des autres classes (notamment à l'instance de Board). Elle affiche le plateau, demande au joueur ce qu'il joue, vérifie si un joueur a gagné, passe au joueur suivant si la partie n'est pas finie.

    while @status == "en cours"

      Show.new.show_board(@board) #affiche le jeu
      @board.play_turn(@player)

      #on check si il y a une victoire
      if @board.victory?(@player, @status) == true
        @status = @player
        puts ""
        Show.new.show_board(@board)
        new_round # relance une partie selon le choix de l'utilisateur

      end

      # passe au joueur suivant
      if @player == @player1
        @player = @player2
      else
        @player = @player1
      end

      # compteur de tours + check s'il y a match nul
      @count_turns += 1
      if @count_turns == 9 && @status == "en cours" # pour check s'il y a un match nul il faut que le status soit "en cours", ou égal à "en cours", c'est pareil en fait. lol.
      @status = "nul" # si le nombre de tours est à 9 et que la partie est toujours en cours, le statut devient "nul".
      puts "Match nul.\n"
      Show.new.show_board(@board)
     end
    end

  end

  def new_round
    # TO DO : relance une partie en initialisant un nouveau board mais en gardant les mêmes joueurs.
      puts "Vous voulez relancer une nouvelle partie? Entrer O si oui N si non"
      print ">"
      answer = gets.chomp
        if answer == "O"
        @board = Board.new
        @status = "En cours"
        @count_turns = 0
        puts "La partie du jeu va recommencer"
      else
        game_end
    end
  end

  def game_end
    # TO DO : permet l'affichage de fin de partie quand un vainqueur est détecté ou si il y a match nul

    puts "La partie est finie !! Reviens vite !!!!!"
  end

end