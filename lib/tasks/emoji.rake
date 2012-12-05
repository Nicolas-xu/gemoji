desc "Copy emoji to the Rails `public/images/emoji` directory"
task :emoji => :environment do
  require 'emoji'

  target = "#{Rails.root}/public/images/emoji"

  mkdir_p "#{target}"
  Dir["#{Emoji.images_path}/emoji/*.png"].each do |src|
    cp src, "#{target}/"
  end

  mkdir_p "#{target}/unicode"
  Dir["#{Emoji.images_path}/emoji/unicode/*.png"].each do |src|
    cp src, "#{target}/unicode/"
  end
end
