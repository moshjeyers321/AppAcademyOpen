namespace :purge_old_urls do
  desc "Purge old urls from table"
  task purge_urls: :environment do
    puts "Purging old URLs..."
    ShortenedUrl.prune(30)
  end

end