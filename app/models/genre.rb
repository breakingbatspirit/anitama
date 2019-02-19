class Genre < ApplicationRecord
    # 親子関係をコメントアウト
	# has_many :cds,dependent: :destroy

    # enum
    # enum generation: {
    #     '〜1970年代':1,
    #     '1980年代':2,
    #     '1990年代':3,
    #     '2000年代':4,
    #     '2010年代':5
    # }

end
