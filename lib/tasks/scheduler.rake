namespace :guests do
  desc "Remove guest accounts more than 3 days old."
  task :cleanup => :environment do
    User.where(guest: true).where("created_at < ?", 2.days.ago).destroy_all
  end
end
