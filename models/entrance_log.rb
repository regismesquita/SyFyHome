class EntranceLog
  include Mongoid::Document
  field :date, type: Date
  field :id, type: String
  field :picture_path, type: String
end
