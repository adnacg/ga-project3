User.destroy_all
Table.destroy_all

json = ActiveSupport::JSON.decode(File.read('db/seeds.json'))

json['user'].each do |item|
    new_user = User.new
    new_user.name = item['name']
    new_user.email = item['email']
    new_user.password = item['password']
    new_user.password_confirmation = item['password_confirmation']
    for i in 0...item['six_seater'].to_i
        new_table = Table.new
        new_table.seater = 6
        new_table.is_free = true
        new_user.tables << new_table
        new_table.save
    end
    for i in 0...item['four_seater'].to_i
        new_table = Table.new
        new_table.seater = 4
        new_table.is_free = true
        new_user.tables << new_table
        new_table.save
    end
    for i in 0...item['two_seater'].to_i
        new_table = Table.new
        new_table.seater = 2
        new_table.is_free = true
        new_user.tables << new_table
        new_table.save
    end
    new_user.save!
end