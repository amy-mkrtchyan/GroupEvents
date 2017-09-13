require 'rails_helper'

describe GroupEvent, type: :model do
  let!(:group_event) { create(:group_event) }

  context 'publish' do
    it 'is not valid without name' do
      group_event.name = nil
      expect(group_event.valid?(:publish)).to be false
    end

    it 'is not valid without description' do
      group_event.description = nil
      expect(group_event.valid?(:publish)).to be false
    end

    it 'is not valid without location' do
      group_event.location = nil
      expect(group_event.valid?(:publish)).to be false
    end

    it 'is not valid without start date' do
      group_event.starts_at = nil
      expect(group_event.valid?(:publish)).to be false
    end

    it 'is not valid without end date' do
      group_event.ends_at = nil
      expect(group_event.valid?(:publish)).to be false
    end
  end

  describe '#publish!' do
    it 'marks group_event as published' do
      expect { group_event.publish }.to change(group_event, :published).from(false).to(true)
    end
  end

  describe 'calc_ends_at!' do
    it 'takes ends_at if specified' do
      group_event.duration = 10
      expect { group_event.save }.to_not change(group_event, :ends_at)
    end

    it 'calculates ends_at from duration' do
      group_event.duration = 10
      group_event.ends_at = nil
      expect { group_event.save }.to change(group_event, :ends_at).to(group_event.starts_at + 10.days)
    end
  end

  describe 'strip_input!' do
    it 'strips name' do
      group_event.name = '   Name   '
      expect{ group_event.save }.to change(group_event, :name).to('Name')
    end

    it 'strips description' do
      group_event.description = '   Description   '
      expect{ group_event.save }.to change(group_event, :description).to('Description')
    end

    it 'strips location' do
      group_event.location = '   Location   '
      expect{ group_event.save }.to change(group_event, :location).to('Location')
    end
  end
end
