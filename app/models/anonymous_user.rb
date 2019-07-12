class AnonymousUser < User
  attr_accessible  :type, :token, as: :registrant

  def register(params)
    params = params.merge(type: 'User', token: nil)
    self.update_attributes(params, as: :registrant)
  end
end
