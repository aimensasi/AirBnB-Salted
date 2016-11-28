module UsersHelper

	def is_admin
		return true if current_user.admin?
	end

	def is_current(user)
		return true if current_user.id == user.id
	end

	def is_admin_or_current(user)
		return true if user.id == current_user.id || user.admin?
	end

end
