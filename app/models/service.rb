class Service < ApplicationRecord
    has_many :attachment
    has_many :feature
end
