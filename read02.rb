#!/usr/bin/env ruby

# date
require 'date'
# blocs
require 'Blockprojet'
# time range
require 'Timerange'


file ='' # file string

# looper dans le fichier :
File.open("./09-01-31.txt").each { |line|
  file += line
}

blocsarray = Array.new
# Faire des objets en trouvant les projets et les heures dans le fichier : 
file.gsub(/^[a-z ]+:\s?\n(?:\s+\d{1,2}h\d{1,2} - \d{1,2}h\d{1,2}\n)+/mi){ |match|
  nomproj = match[/^[a-z ]+/i] # trouver le nom du projet 
  heures = Array.new
  # sub match processing :
  match.gsub(/(\d{1,2}h\d{1,2}) - (\d{1,2}h\d{1,2})/) { |line|
    heures << Timerange.new(line[$1], line[$2]) # faire objet Timerange
  }
  blocsarray << Blockprojet.new(nomproj, heures) # faire objet Blockprojet
}


# puts blocsarray.inspect

total = 0
# Afficher les minutes pour chaque projets :
blocsarray.each { |bloc|
  puts bloc.nom + ' : ' + bloc.get_all_minutes.to_s + 'min. ou ' + (bloc.get_all_minutes / 60).to_s + 'h' + (bloc.get_all_minutes % 60).to_s
  total += bloc.get_all_minutes
}

puts ' '
puts 'TOTAL : ' + total.to_s + 'min. ou ' + (total / 60).to_s + 'h' + (total % 60).to_s
