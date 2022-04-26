require_relative "../models/room"
require "csv"

class RoomRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @rooms = []

    load_csv
  end

  def find(id)
    # Returns the room for the first true match
    @rooms.find { |room| room.id == id }
  end

  private

  def load_csv
    options = { headers: :first, header_converters: :symbol }
    CSV.foreach(@csv_file_path, options) do |row|
      # Type cast
      row[:id] = row[:id].to_i
      row[:capacity] = row[:capacity].to_i

      @rooms << Room.new(row)
    end
  end
end
