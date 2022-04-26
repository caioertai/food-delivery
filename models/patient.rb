class Patient
  attr_accessor :id
  attr_reader :name, :cured, :room

  def initialize(attributes = {})
    # { id: 1, name: "John", cured: false, room_id: 2 }
    @id    = attributes[:id] # Integer
    @name  = attributes[:name] # String
    @cured = attributes[:cured] || false # boolean
    @room  = attributes[:room] # Room instance
  end

  def assign_room(new_room)
    @room = new_room
  end
end
