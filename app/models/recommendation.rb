class Recommendation < ActiveRecord::Base
    belongs_to :user
    belongs_To :channel
end