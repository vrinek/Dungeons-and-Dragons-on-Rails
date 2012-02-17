begin
  MongoMapper.config = {
    Rails.env => { 'uri' => ENV['MONGOHQ_URL'] || 'mongodb://localhost/sushi' }
  }

  MongoMapper.connect(Rails.env)
  MongoMapper::Document.plugin(MongoMapper::Plugins::IdentityMap)
rescue => ex
  # should only rescue on 'rake assets:precompile:all'
  puts ex.message + " but it's ok, I still love you"
end
