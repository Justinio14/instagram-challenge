require 'rails_helper'

describe Image, type: :model do
  it 'is not valid with a name of less than three characters' do
    image = Image.new(name: "th")
    expect(image).not_to be_valid
  end

end
