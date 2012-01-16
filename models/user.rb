class User 
  include Mongoid::Document
    field :name, type: String
    field :face_id, type: String
    field :favorite_artists, type: Array
    field :last_fm, type: String
    field :pictures, type: Array, :default => Array.new
end
        
