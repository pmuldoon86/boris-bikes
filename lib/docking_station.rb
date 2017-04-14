require_relative   'bike'

class DockingStation
  attr_reader :capacity

  DEFAULT_CAPACITY = 20

  def initialize
     @bikes = []
     @capacity = DEFAULT_CAPACITY
  end

  def release_bike
    fail 'No bikes available' if empty?
     @bikes.pop
  end

  def dock(bike)
    fail 'Docking station full' if full?
     @bikes << bike
     bike
  end

private
  attr_accessor :bikes

  def full?
    @bikes.count >= @capacity
  end

  def empty?
    @bikes.empty?
  end

end
