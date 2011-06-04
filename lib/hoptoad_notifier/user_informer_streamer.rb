module HoptoadNotifier
  class UserInformerStreamer
    attr_accessor :body, :notice_id
    def initialize(body, notice_id)
      @body = body
      @notice_id = notice_id.to_s
    end

    MATCH = "<!-- HOPTOAD ERROR -->"

    def each(&block)
      body.each do |chunk|
        block.call(chunk.gsub(MATCH, @notice_id))
      end
    end
  end
end
