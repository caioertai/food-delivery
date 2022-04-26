class Room
  attr_accessor :id
  attr_reader :patients

  def initialize(attributes = {})
    @id       = attributes[:id]
    @capacity = attributes[:capacity] || 0
    @patients = attributes[:patients] || []
  end

  def add_patient(new_patient)
    raise StandardError, "overcapacity" if full?

    @patients << new_patient # changing the state of the room inst
    new_patient.assign_room(self) # change the @room from the patient
  end

  def full?
    @patients.size >= @capacity
  end
end

