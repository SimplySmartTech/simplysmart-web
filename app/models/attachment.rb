class Attachment < ApplicationRecord
    belongs_to :service
    enum attachment_type: {image:0,video:1}
end
