require_relative "../models/patient"
require "csv"

class PatientRepository
  def initialize(csv_file_path, room_repository)
    @csv_file_path = csv_file_path
    @room_repository = room_repository
    @patients = []

    load_csv
  end

  def all
    @patients
  end

  def add(new_patient)
    new_patient.id = next_id
    # Before I push
    @patients << new_patient

    # the write the csv
  end

  private

  def next_id
    @patients.empty? ? 1 : @patients.last.id + 1
  end

  def load_csv
    options = { headers: :first, header_converters: :symbol }
    CSV.foreach(@csv_file_path, options) do |row|
      # Type cast
      # { id: "1", name: "John", cured: "false", room_id: "2" }
      row[:id] = row[:id].to_i
      row[:room_id] = row[:room_id].to_i
      row[:cured] = (row[:cured] == "true") # true / false
      # { id: 1, name: "John", cured: false, room_id: 2 }
      patient = Patient.new(row)

      patient_room = @room_repository.find(row[:room_id])
      patient.assign_room(patient_room)

      @patients << patient
    end
  end
end
