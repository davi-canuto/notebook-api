namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    puts "Resetando o banco de dados..."
    %x(rails db:drop db:create db:migrate)

    p "Cadastrando os tipos de contatos..."
    kinds = %w(Amigo Comercial Conhecido)

    kinds.each do |kind|
      Kind.create!(
        description: kind
      )
    end
    p "Tipos de Contatos cadastrados com sucesso"

    #########################

    p "Cadastrando os contatos..."
    100.times do |i|
      Contact.create!(
        name: Faker::Name.name ,
        email: Faker::Internet.email ,
        birthdate: Faker::Date.birthday(min_age: 18, max_age: 65),
        kind: Kind.all.sample
      )
    end
    p "Contatos cadastrados com sucesso"

    ###############################

    p "Cadastrando os telefones..."
    Contact.all.each do |contact|
      Random.rand(5).times do |i|
        phone = Phone.create!(number:Faker::PhoneNumber.cell_phone)
        contact.phones << phone
        contact.save!
      end
    end
    p "Telefones cadastrados com sucesso"

     ###############################

    p "Cadastrando os endereços..."
    Contact.all.each do |contact|
      address = Address.create(
        street: Faker::Address.street_address,
        city: Faker::Address.city,
        contact: contact
      )
    end
    p "Endereços cadastrados com sucesso"

  end
end
