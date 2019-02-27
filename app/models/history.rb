class History < ApplicationRecord
	has_many :history_cds,dependent: :destroy
	belongs_to :user
	enum genre_id: {
        '発送待ち':0,
        '発送済み':1,
    }

  def self.search(search)
     if search
      history1 = History.where("histories_name LIKE ? ", "%#{search}%")
      history2 = History.where("histories_address LIKE ? ", "%#{search}%")
      history3 = History.joins(:history_cds).where("history_cd_album LIKE ?", "%#{search}%")
      result = history1 | history2 | history3
  	else
  	  result = History.all
	end
  end
end
