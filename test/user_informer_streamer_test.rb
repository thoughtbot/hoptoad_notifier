require File.dirname(__FILE__) + '/helper'

class UserInformerStreamerTest < Test::Unit::TestCase
  should "respond to #each" do
    assert_respond_to HoptoadNotifier::UserInformerStreamer.new([], 12345), :each
  end

  should "call each on the supplied body" do
    body = stub(:each)
    streamer = HoptoadNotifier::UserInformerStreamer.new(body, 12345)
    streamer.each
    assert_received(body, :each)
  end

  should "apply a gsub to each chunk out of wrapped #each" do
    body = ["one", "<!-- HOPTOAD ERROR -->", "three"]
    expected = ["one", "#12345", "three"]
    streamer = HoptoadNotifier::UserInformerStreamer.new(body, "#12345")
    streamer.each do |chunk|
      assert_equal expected.shift, chunk
    end
  end
end
