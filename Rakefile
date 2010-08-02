require 'yaml'

namespace :article do
  desc "Create a new article"
  task :new do
    puts "What is the title of your new article?"
    title = STDIN.gets.chomp

    article = { 'title' => title,
                'date' => Time.now.strftime("%d/%m/%Y")}.to_yaml
    article << "\n"
    article << "Here goes your content\n\n"


    path = "articles/#{Time.now.strftime("%Y-%m-%d")}-#{title.split(" ").join("-")}.yaml"

    unless File.exist? path
      File.open(path, "w") do |file|
        file.write article
      end
      puts "#{title} sounds like an awesome title!"
    else
      puts "Can't create Article, maybe an awesome article with that title already exists!"
    end
  end
end
