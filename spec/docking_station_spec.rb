require 'docking_station'

describe DockingStation do
  describe '#initialization' do
    docking_station = DockingStation.new(50)
      it 'has a variable capacity' do
        50.times {docking_station.dock Bike.new}
        expect { docking_station.dock(Bike.new)} .to raise_error 'Docking station full'
      end
  end

  describe '#release_bike' do
    bike = Bike.new
    it 'releases a bike' do
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end
    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end

    it 'releases working bikes' do
      # bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to be_working
    end

    it 'responds to release_bike' do
      expect(subject).to respond_to :release_bike
    end
  end

  describe '#dock'do
  bike = Bike.new

    it { is_expected.to respond_to(:dock).with(1).argument }
  #  it { is_expected.to respond_to(:bikes) }
  # don't normally test private methods
    it 'docks something' do
      expect(subject.dock(bike)).to eq bike
    end

    it 'raises an error when the docking station is full' do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock Bike.new}
      expect { subject.dock bike}.to raise_error 'Docking station full'
    end
  end

  describe '#capacity' do
    it { is_expected.to respond_to :capacity}
    it 'has a default capacity' do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end
  end
end
