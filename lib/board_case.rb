
class BoardCase
  #TO DO : la classe a 2 attr_accessor, sa valeur en string (X, O, ou vide), ainsi que son identifiant de case
  attr_accessor :state, :id_case


  def initialize(id)
    #TO DO : doit régler sa valeur, ainsi que son numéro de case
    @state = "_"
  	@id_case = id
  end
  
end