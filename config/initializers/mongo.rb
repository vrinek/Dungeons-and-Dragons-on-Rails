begin
  url = ENV['MONGOHQ_URL'] || "mongodb://localhost/sushi_#{Rails.env}"

  MongoMapper.config = {
    Rails.env => {'uri' => url}
  }

  MongoMapper.connect(Rails.env)
  MongoMapper::Document.plugin(MongoMapper::Plugins::IdentityMap)
rescue => ex
  # should only rescue on 'rake assets:precompile:all'
  puts ex.message + " but it's ok, I still love you"
end
