desc "Reset Review"
task :reset_review_count => :enviroment do
  Course.all.each do |course|
    Course.reset.all_counters(course.id, :reviews)
  end
end