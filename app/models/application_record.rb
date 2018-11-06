class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  enum sort_selection: {
    値段が安い順:0,値段が高い順:1
  }

  enum conditions_selections: {
    全ての商品:0,販売中の商品:1,売り切れの商品:2
  }

end
