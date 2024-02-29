# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

#finds candidate by id
def find(id)
  candidates.each do |candidate|
    return candidate if candidate[:id] == id
  end
  # Return nil if no candidate with the given id is found
  return nil
end
  
#determines if the candidate has 2+ years of experience
def experienced?(candidate)
  if candidate.has_key?(:years_of_experience) && candidate[:years_of_experience] >= 2
    return true
  else
    return false
  end
end
  
#dertermines is the candidate is qualified
def qualified_candidates(candidates)
   candidates.select do |candidate|
    experienced?(candidate) &&
    has_enough_github_points?(candidate) &&
    knows_ruby_or_python?(candidate) &&
    applied_recently?(candidate) &&
    is_adult?(candidate)
  end
end

#checks the candidate's github points
def has_enough_github_points?(candidate)
  candidate[:github_points] && candidate[:github_points] >= 100
end

#checks if candidate knows ruby or python
def knows_ruby_or_python?(candidate)
  candidate[:languages] && (candidate[:languages].include?('Ruby') || candidate[:languages].include?('Python'))
end

#checks the date of the aplication and makes sure it's recent
def applied_recently?(candidate)
  candidate[:date_applied] && (Date.today - candidate[:date_applied]).to_i <= 15
end

#makes sure the candidate is an adult
def is_adult?(candidate)
  candidate[:age] && candidate[:age] > 17
end

#orders candidates with most expreienced first
#if they have the same amount of experience they're sorted by who has the higher github points
def ordered_by_qualifications(candidates)
  candidates.sort_by { |candidate| [-candidate[:years_of_experience], -candidate[:github_points]] }
end