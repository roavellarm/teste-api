# frozen_string_literal: true

module ModelFactories
  TABLES_TO_CLEAN = ['public.users'].freeze

  def seed_database
    average_joe
  end

  def teardown
    TABLES_TO_CLEAN.each do |table|
      ActiveRecord::Base.connection.execute "TRUNCATE TABLE #{table} CASCADE"
    end
  end

  def average_joe
    @average_joe ||= User.find_or_create_by!(
      email: 'joe@teste.com', first_name: 'Average', last_name: 'Joe'
    ) do |u|
      u.password = 'password'
    end
  end
end
