class EmployeesController < ApplicationController
	before_filter :authenticate_super_admin!, :only => [:new, :create, :update, :destroy]

	def new
	end

	def create
	end

	def show
	end

	def destroy
	end

	def update
	end

	def edit
	end
end