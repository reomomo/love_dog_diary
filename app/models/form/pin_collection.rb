# class Form::PinCollection < Form::Base
#   DEFAULT_ITEM_COUNT = 50
#   attr_accessor :pins

#   def initialize(attributes = {})
#     super attributes
#     self.pins = FORM_COUNT.times.map { Pin.new() } unless self.pins.present?
#   end

#   def pins_attributes=(attributes)
#     self.pins = attributes.map { |_, v| Pin.new(v) }
#   end

#   def save
#     Pin.transaction do
#       self.pins.map(&:save!)
#     end
#   end


# end