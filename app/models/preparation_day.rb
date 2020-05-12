class Preparation_day < ActiveHash::Base
  self.data = [
      {id: 1, preparation_day: '1~2日で発送'}, 
      {id: 2, postage_payer: '2~3日で発送'},
      {id: 3, postage_payer: '4~7日で発送'}
  ]
end
