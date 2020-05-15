class Review < ActiveHash::Base
  self.data = [
    {id: 1, evaluation: 'excellent'}, 
    {id: 2, evaluation: 'good'}, 
    {id: 3, evaluation: 'poor'}
  ]
end
