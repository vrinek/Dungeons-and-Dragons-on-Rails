MongoMapper.config = {
  Rails.env => { 'uri' => ENV['MONGOHQ_URL'] || 'mongodb://localhost/sushi' }
}

MongoMapper.connect(Rails.env)
MongoMapper::Document.plugin(MongoMapper::Plugins::IdentityMap)
