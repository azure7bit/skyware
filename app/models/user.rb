class User < ActiveRecord::Base
	attr_accessor :facebook, :twitter, :linkedin, :flickr, :pinterest, :tumblr, :dropbox, :google_plus, :instagram, :github, :bitbucket, :vk
	belongs_to :superadmin
end