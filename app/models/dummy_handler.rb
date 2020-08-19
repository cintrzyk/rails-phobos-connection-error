class DummyHandler
  include Phobos::Handler
  include Phobos::Producer

  def consume(payload, metadata)
    Rails.logger.info(payload.inspect + "    " + metadata[:listener_id].inspect)
  end

  def publish(value)
    producer.publish(topic: 'test-topic', payload: { key: value }.to_json)
  end
end
