class Service < ApplicationRecord
    has_many :attachments
    has_many :features
end
