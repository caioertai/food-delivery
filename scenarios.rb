require_relative "repositories/patient_repository"
require_relative "repositories/room_repository"
require_relative "models/patient"

room_repo = RoomRepository.new("data/rooms.csv")
patient_repo = PatientRepository.new("data/patients.csv", room_repo)

patient = Patient.new(name: "Joe")
p patient
# Is this patient persisted?
# No

patient_repo.add(patient) # also assign an id
p patient
# Is this patient persisted?
# Yes
