namespace :db do
	desc "Delete and insert data"
	task :populate => :environment do
		require 'populator'
		require 'faker'

		[BlogPost, UserComment, Asset].each(&:delete_all)


		BlogPost.populate 20 do |bp|
			bp.title = Populator.words(3..5).titleize
			bp.content = Populator.sentences(2..10)
			bp.created_at = 1.years.ago..Time.now
			bp.user_id  = [4, 5]

			UserComment.populate 1..5 do |uc|
				uc.commenter = Faker::Internet.user_name
				uc.body = Populator.sentences(1)
				uc.blog_post_id = bp.id
				uc.created_at = bp.created_at
			end
		end
	end
end