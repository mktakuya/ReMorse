require_relative '../remorse'

if __FILE__ == $0
  remorse = Remo::ReMorse.new do |config|
    config.token = ENV['NATURE_API_TOKEN']
    config.turn_on_signal_id = ENV['NATURE_SIGNAL_ON_ID']
    config.turn_off_signal_id = ENV['NATURE_SIGNAL_OFF_ID']
  end

  3.times { remorse.dot }
  3.times { remorse.dash }
  3.times { remorse.dot }
end
