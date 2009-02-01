class Blockprojet
  attr_accessor :nom, :heures
  
  # nom:String, heures:Timerange
  def initialize(nom, heures)
    @nom = nom
    @heures = heures
  end
  
  # calculer toutes les minutes des objets :
  def get_all_minutes
    total = 0
    @heures.each { |heure|
      total += heure.get_minutes
    }
    total
  end
  
  # trouver un projet par nom :
  def self.trouve_par_nom(nom)
    found = nil
    ObjectSpace.each_object(Blockprojet) { |o|
      found = o if o.nom == nom
    }
    found
  end
end