class Timerange
  attr_accessor :from, :to
  
  # de la forme : \d{1,2}h\d{1,2}
  def initialize(from, to)
    @from = from
    @to = to
  end
  
  # retourner les minutes d'un objet TimeRange :
  def get_minutes
    de = self.string_to_datetime(@from)
    a = self.string_to_datetime(@to)
    
    total = ((a.hour - de.hour) * 60) + (a.min - de.min)
  end
  
  # convertir le string HHhMM en float :
  def string_to_datetime(timestring)
    match = timestring[/(\d{1,2})h(\d{1,2})/]
    retour = DateTime.civil(2000,1,1,match[$1].to_i,match[$2].to_i,0)
  end
end
