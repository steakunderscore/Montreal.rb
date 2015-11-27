# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  starts_at  :datetime         not null
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe Event, :type => :model do
  let(:event) { build(:event) }

  it "has a valid factory" do
    expect(event).to be_valid
  end

  describe ".published" do
    it "orders event by starting date" do
      date1, date2, date3 = create(:event, starts_at: 1.month.ago), create(:event, starts_at: 2.month.ago), create(:event, starts_at: 3.month.ago)
      expect(Event.published).to eq [date1, date2, date3]
    end
  end

  describe "#location" do
    context "it has no specified location" do
      let(:event) { build(:event, location: nil) }

      it "has a TBA location by default" do
        expect(event.location).to be_a TBALocation
      end

      context "it has a specified location" do
        let(:location) { build(:location) }
        let(:event) { build(:event, location: location) }
        it "returns it location" do
          expect(event.location).to eq location
        end
      end
    end
  end

  describe "#title_with_date" do
    let(:event) { build(:event, title: "Amazing Workshop", starts_at: Time.new(2015, 11, 24)) }

    # TODO: make an helper out of that method
    it "outputs a well formated title with date" do
      expect(event.title_with_date).to eq "Amazing Workshop : November 24"
    end
  end
end
