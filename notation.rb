require_relative 'pointer'
require 'json'

class Notation
  def initialize
    @notation = { 'logs' => []}
    @turn_counter = 1
  end

  def record(player, from, to)
    @notation['logs'] << {
      'turn' => @turn_counter,
      'player' => player.name,
      'from' => from,
      'to' => to
    }
    @turn_counter += 1
  end

  def output
    File.open('notation.json', 'w') do |file|
      file.puts @notation.to_json
    end
  end
end
