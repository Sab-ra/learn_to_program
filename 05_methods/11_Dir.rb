# Find a particular file in root
puts Dir[ "MeaningOfLife" ]
puts Dir[ "learning_plan.md" ]
puts Dir[ "07_arithmetics.rb" ]

# All three above didn't work :(

# search for all jpgs
Dir[ "*.jpg" ]

# for case sensitive search 
Dir[ "*.{ JPG, gpg }" ]
