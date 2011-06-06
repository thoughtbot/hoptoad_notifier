module HoptoadNotifier
  class UserInformerStreamer
    attr_accessor :body, :notice_id
    def initialize(body, replacement)
      @body = body
      @replacement = replacement.to_s
    end

    MATCH = "<!-- HOPTOAD ERROR -->"

    def each(&block)
      body.each do |chunk|
        block.call(chunk.gsub(MATCH, @replacement))
      end
    end
  end
end
