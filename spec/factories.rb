require "factory_girl"

FactoryGirl.define do
  factory :dummy_post, :class => Post do
    factory :oor_post do
      title   'Objects On Rails spotlight'
      summary 'Plain Ruby Objects everywhere!'
      content 'Forget everything you knew before....'
    end

    factory :js_post do
      title   'Javascript and Web 2.0'
      summary 'How JS slowdown the web.'
      content 'Sometimes JS become tooooo slooow'
    end

    factory :unpublished_post do
      title   'I am hidded'
      summary 'You should not see me!'
      content 'How you got here???!!!!'
    end
  end


  #
  ## This will use the User class (Admin would have been guessed)
  #factory :admin, :class => User do
  #  first_name 'Admin'
  #  last_name  'User'
  #  admin true
  #end
  #
  ## The same, but using a string instead of class constant
  #factory :admin, :class => 'user' do
  #  first_name 'Admin'
  #  last_name  'User'
  #  admin true
  #end
end
