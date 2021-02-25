require 'rails_helper'

RSpec.describe Linker, type: :model do
  it 'create a linker' do
    linker = Linker.create(url: 'https://stackoverflow.com/questions/136793/is-there-a-do-while-loop-in-ruby',
                           email: 'test@t.com')
    expect(linker.times).to eq(0)
    expect(linker.short_path.present?).to be(true)
    expect(linker.uid.present?).to be(true)
  end

  it 'a linker with no email' do
    linker = Linker.new(url: 'https://stackoverflow.com/questions/136793/is-there-a-do-while-loop-in-ruby')
    expect(linker.valid?).to be(false)
  end

  it 'a linker with no url' do
    linker = Linker.new(email: 'test@t.cn')
    expect(linker.valid?).to be(false)
  end
end
