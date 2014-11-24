require 'sinatra'
require 'dinosaurus'

Dinosaurus.configure do |config|
config.api_key = 'cecaa270c7146d8be41da5647bef0b93'
end

get "/" do
  redirect "ipsum.html"
end

post "/" do
  topic = params['topic']
  @words = Dinosaurus.synonyms_of (topic)

  @content = ''

  params[:number].to_i.times do
    @content += '<p>&nbsp;&nbsp;&nbsp;&nbsp;'
    params[:snumber].to_i.times do
      (rand(16) + 4).times do
        @content += ' ' + @words.sample
      end
      @content += '.'
    end
    @content += "</p>"
  end
  erb :view1
end

