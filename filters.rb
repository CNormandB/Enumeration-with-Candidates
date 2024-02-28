# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
    # Your code Here
  end
  
  def experienced?(candidate)
  if candidate.has_key?(:years_of_experience) && candidate[:years_of_experience] >= 2
    return true
  else
    return false
  end
  end
  
  def qualified_candidates(candidates)
    # Your code Here
  end
  
  # More methods will go below