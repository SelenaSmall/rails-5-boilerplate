class CreateSeedUser < ActiveRecord::Migration[5.0]
  def up
    User.create(email: 'selenawiththetattoo@gmail.com',
    			role: 'admin',
    			password: 'password')
  end

  def down
  	User.where(email: 'selenawiththetattoo@gmail.com').destroy_all
  end
end
