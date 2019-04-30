require 'faraday'

class ReMorse
  attr_writer :token, :turn_on_signal_id, :turn_off_signal_id

  def initialize(options = {})
    options.each do |key, value|
      instance_variable_set("@#{key}", value)
    end
    yield(self) if block_given?
  end

  def dot
    turn_on
    turn_off
  end

  def dash(interval=0.5)
    turn_on
    sleep interval
    turn_off
  end

  private
  def turn_on
    url = "https://api.nature.global/1/signals/#{@turn_on_signal_id}/send"
    Faraday.new(url).post { |req| req.headers['Authorization'] = "Bearer #{@token}" }
  end

  def turn_off
    url = "https://api.nature.global/1/signals/#{@turn_off_signal_id}/send"
    Faraday.new(url).post { |req| req.headers['Authorization'] = "Bearer #{@token}" }
  end
end
