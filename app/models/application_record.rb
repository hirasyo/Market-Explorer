class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  enum sort_selection: {
    値段が安い順:0,値段が高い順:1
  }

  enum conditions_selections: {
    全ての商品:0,販売中の商品:1,売切れの商品:2
  }

  enum price_selections: {
    なし:0,１０００円:1,３０００円:2,５０００円:3,１００００円:4,３００００円:5,５００００円:6,１０００００円:7
  }

end
