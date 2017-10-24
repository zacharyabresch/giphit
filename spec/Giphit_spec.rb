require './lib/giphit'

MY_KEY = 'EexgAijeAL0K67OMX2LWUtVSjLCsHAHB'

describe Giphit do
  it "is an instance of Giphit" do
    giphit = Giphit.new(MY_KEY)
    expect(giphit).to be_a_kind_of(Giphit)
  end

  it "responds to #random" do
    giphit = Giphit.new(MY_KEY)
    expect(giphit).to respond_to(:random)
  end

  it "responds to #search" do
    giphit = Giphit.new(MY_KEY)
    expect(giphit).to respond_to(:search).with(1).argument
  end
end