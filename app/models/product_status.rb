class Product_Status < ActiveHash::Base
  self.data = [
      {id: 1, product_status: '新品未使用'},
      {id: 2, product_status: '未使用に近い'},
      {id: 3, product_status: '目立った傷や汚れなし'},
      {id: 4, product_status: 'やや傷や汚れあり'},
      {id: 5, product_status: '傷や汚れあり'},
      {id: 6, product_status: '全体的に状態が悪い'},
  ]