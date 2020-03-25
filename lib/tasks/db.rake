# frozen_string_literal: true

namespace :db do
  desc 'CONFIGURES DUMMY DATA'
  task config: :environment do
    puts 'Configuring dummy records'
    puts "Dropping... #{`rake db:drop`}"
    `rake db:drop`
    puts 'Creating DB...'
    `rake db:create`
    puts 'Migrating...'
    `rake db:migrate`
    puts 'Seeding Real Data'
    `rake db:populate`
    puts 'Seeding Dummies'
    `rake db:fake`
    puts 'Seeding Default Users'
    `rake db:seed`
    puts 'Done...'
  end

  desc 'TODO'
  task populate: :environment do
    ### CREATING CATEGORIES

    categories = ['Médica',
                  'Esportes',
                  'Educação e Carreira',
                  'Estética',
                  'Gastronomia',
                  'Loja Virtual',
                  'Cultura',
                  'Serviços',
                  'Hobbies',
                  'Drinks']

    categories.each do |category|
      Category.find_or_create_by(name: category) do |_w|
        puts 'Creating Category ' + category + '...'
      end
    end

    ###

    ### CREATING SUBGROUPS

    sub_groups_hash = [{ name: 'Consulta Médica', category: 1 },
                       { name: 'Clínicas e Hospitais', category: 1 },
                       { name: 'Exames e Laboratórios', category: 1 },
                       { name: 'Drogaria', category: 1 },
                       { name: 'Odontologia', category: 1 },
                       { name: 'Ótica', category: 1 },
                       { name: 'Academia', category: 2 },
                       { name: 'Pilates e Yoga', category: 2 },
                       { name: 'Spa', category: 4 },
                       { name: 'Barbearia', category: 4 },
                       { name: 'Salão de Beleza', category: 4 },
                       { name: 'Depilação', category: 4 },
                       { name: 'Universidades e Pós Graduação', category: 3 },
                       { name: 'Escola de Idiomas', category: 3 },
                       { name: 'Curso Técnico e Profissionalizante', category: 3 },
                       { name: 'Auto Escola', category: 3 },
                       { name: 'Escola e Creche', category: 3 },
                       { name: 'Intercambio', category: 3 },
                       { name: 'Show', category: 7 },
                       { name: 'Cinema', category: 7 },
                       { name: 'Buffet Infantil', category: 8 },
                       { name: 'Teatro', category: 7 },
                       { name: 'Exposições', category: 7 },
                       { name: 'Museu', category: 7 },
                       { name: 'Eventos', category: 7 },
                       { name: 'Passeio e Turismo', category: 7 },
                       { name: 'Restaurantes', category: 5 },
                       { name: 'Cafés', category: 5 },
                       { name: 'Doceria', category: 5 },
                       { name: 'Bares', category: 5 },
                       { name: 'Boates', category: 10 },
                       { name: 'Clubes', category: 10 },
                       { name: 'HQ', category: 9 },
                       { name: 'Miniaturas', category: 9 },
                       { name: 'NERD', category: 9 },
                       { name: 'Comércio em Geral', category: 8 },
                       { name: 'Hospedagem e Hotelaria', category: 8 },
                       { name: 'Mecânica e serv. Automotivos', category: 8 },
                       { name: 'Clínica Estética', category: 4 },
                       { name: 'Casa e Decoração', category: 4 },
                       { name: 'Atendimento Domiciliar', category: 8 }]

    sub_groups_hash.each do |sub_group|
      SubGroup.find_or_create_by(name: sub_group[:name]) do |w|
        puts 'Creating SubGroup ' + sub_group[:name] + '...'
        w.categories << Category.find(sub_group[:category])
        puts 'Nesting SubGroup to Category ' + Category.find(sub_group[:category]).name
      end
    end

    ###

    ### CREATING GROUPS

    groups_hash = [{ name: 'Acupuntura', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Alergia e Imunologia Pediátrica', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Alergologia', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Alergologia Infantil', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Anesteologia', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Angiologia', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Angioradiologia e Cirurgia Endovascular',
                     subgroup: 'Clínicas e Hospitais' },
                   { name: 'Aparelho digestivo', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Atendimento ao queimado', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Botox', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Cardiologia', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Cardiologia Pediatrica', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Cirurgia Bariátrica', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Cirurgia Cardiaca', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Cirurgia Cardiovascular', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Cirurgia Cranio Maxilo Facial', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Cirurgia da Mão', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Cirurgia de Cabeça', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Cirurgia de Esclera', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Cirurgia do Aparelho Digestivo', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Cirurgia do Trauma', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Cirurgia Geral', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Cirurgia Ocular', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Cirurgia Oncologica', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Cirurgia Otorrinolaringologia', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Cirurgia Pediátrica', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Cirurgia Plástica', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Cirurgia Plástica Facial', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Cirurgia Plástica', subgroup: 'Consulta Médica' },
                   { name: 'Cirurgia Plástica Reparadora', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Cirurgia Toráxica', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Cirurgia Vascular', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Cirurgia Videolaparoscópica', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Cirurgia Vitreo', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Citopatologia', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Clínica Geral', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Coloscopia', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Densitometria Óssea', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Dermatologia', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Dermatologia Pediatrica', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Diagnóstica', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Diagnóstico por Imagem', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Doenças Respiratórias', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Domiciliar', subgroup: 'Consulta Médica' },
                   { name: 'Dor', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Ecocardiograma', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Ecografia ', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Eletrocardiograma', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Eletroencefalograma', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Eletrofisiologia Clínica Invasiva', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Emergência pediátrica', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Endocrinologia', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Endocrinologia Pediátrica', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Endoscopia', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Endoscopia Digestiva', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Endoscopia Ginecológica', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Endoscopia Respiratória', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Ergometria', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Estimulação Cardíaca Eletrônica Implantável',
                     subgroup: 'Clínicas e Hospitais' },
                   { name: 'Fisioterapia', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Foniatria', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Fonoaudiologia', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Fonoterapia', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Gastroenterologia Pediátrica', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Geriatria', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Ginecologia', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Gastroenterologia', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Hansenologia', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Hemato Oncologia', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Hematologia', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Hemodinâmica e Cardiologia Intervencionista',
                     subgroup: 'Clínicas e Hospitais' },
                   { name: 'Hepatologia', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Infectologia ', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Infectologia Pediátrica', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Ressonância Magnética Cardíaca e Mamária',
                     subgroup: 'Clínicas e Hospitais' },
                   { name: 'Medicina de Urgência', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Medicina do Adolescente', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Medicina do Sono', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Medicina Fetal', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Medicina Intensiva Pediátrica', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Medicina Paliativa', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Medicina Preventiva do Câncer', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Medicina Tropical', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Nefrologia', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Nefrologia Pediátrica', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Neonatologia', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Neuro Oftalmologia', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Neurocirurgia', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Neurofisiologia Clínica', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Neurologia', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Neurologia Pediátrica', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Neuropediatria', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Neurorradiologia', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Nutrição', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Nutrição Parenteral e Enteral', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Nutrição Parenteral e Enteral Pediátrica',
                     subgroup: 'Clínicas e Hospitais' },
                   { name: 'Nutrologia', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Nutrologia Pediátrica', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Oftalmologia', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Obstetrícia', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Oncologia', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Oncologia Cirúrgica', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Oncologia Pediátrica', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Ortomolecular', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Ortopedia facial', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Otorrinolaringologia', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Pediatria', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Perícia Médica', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Pneumologia', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Pneumopediatria', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Proctologia', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Psicogeriatria', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Psicologia', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Psicopedagogia', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Psiquiatria', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Psiquiatria da Infância e Adolescência',
                     subgroup: 'Clínicas e Hospitais' },
                   { name: 'Psiquiatria Forense', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Quimioterapia', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Reeducação Postural Global', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Sexualidade Humana', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Terapia Ocupacional', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Tisiologia', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Toxicologia Médica', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Transplante de medula óssea', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Traumatologia', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Urologia', subgroup: 'Clínicas e Hospitais' },
                   { name: 'UTI Geral', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Vascular', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Farmácia e Drogaria', subgroup: 'Drogaria' },
                   { name: 'Farmácia de Manipulação ', subgroup: 'Drogaria' },
                   { name: 'Acupuntura', subgroup: 'Consulta Médica' },
                   { name: 'Alergia e Imunologia', subgroup: 'Consulta Médica' },
                   { name: 'Alergologia', subgroup: 'Consulta Médica' },
                   { name: 'Anesteologia', subgroup: 'Consulta Médica' },
                   { name: 'Angiologia', subgroup: 'Consulta Médica' },
                   { name: 'Cardiologia', subgroup: 'Consulta Médica' },
                   { name: 'Cardiologia', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Clínica Geral', subgroup: 'Consulta Médica' },
                   { name: 'Dermatologia', subgroup: 'Consulta Médica' },
                   { name: 'Doenças Respiratórias', subgroup: 'Consulta Médica' },
                   { name: 'Dor', subgroup: 'Consulta Médica' },
                   { name: 'Ergometria', subgroup: 'Consulta Médica' },
                   { name: 'Fisioterapia', subgroup: 'Consulta Médica' },
                   { name: 'Fonoaudiologia', subgroup: 'Consulta Médica' },
                   { name: 'Geriatria', subgroup: 'Consulta Médica' },
                   { name: 'Ginecologia', subgroup: 'Consulta Médica' },
                   { name: 'Grastroenterologia', subgroup: 'Consulta Médica' },
                   { name: 'Imunologia e Alergia', subgroup: 'Consulta Médica' },
                   { name: 'Infectologia ', subgroup: 'Consulta Médica' },
                   { name: 'Neurologia', subgroup: 'Consulta Médica' },
                   { name: 'Nutrição', subgroup: 'Consulta Médica' },
                   { name: 'Oftalmologia', subgroup: 'Consulta Médica' },
                   { name: 'Otorrinolaringologia', subgroup: 'Consulta Médica' },
                   { name: 'Pediatria', subgroup: 'Consulta Médica' },
                   { name: 'Pneumologia', subgroup: 'Consulta Médica' },
                   { name: 'Proctologia', subgroup: 'Consulta Médica' },
                   { name: 'Psicologia', subgroup: 'Consulta Médica' },
                   { name: 'Psicopedagogia', subgroup: 'Consulta Médica' },
                   { name: 'Psiquiatria', subgroup: 'Consulta Médica' },
                   { name: 'Quiropraxia', subgroup: 'Consulta Médica' },
                   { name: 'Terapia Ocupacional', subgroup: 'Consulta Médica' },
                   { name: 'Traumatologia', subgroup: 'Consulta Médica' },
                   { name: 'Urologia', subgroup: 'Consulta Médica' },
                   { name: 'Veterinária', subgroup: 'Consulta Médica' },
                   { name: 'Ortodontia', subgroup: 'Consulta Médica' },
                   { name: 'Medicina da Família ', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Medicina da Família ', subgroup: 'Consulta Médica' },
                   { name: 'Metabologia', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Metabologia', subgroup: 'Consulta Médica' },
                   { name: 'Medicina Generalista', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Medicina Generalista', subgroup: 'Consulta Médica' },
                   { name: 'Ortopedia', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Ortopedia', subgroup: 'Consulta Médica' },
                   { name: 'Reumatologia', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Reumatologia', subgroup: 'Consulta Médica' },
                   { name: 'Tomografia', subgroup: 'Exames e Laboratórios' },
                   { name: 'Radiologia', subgroup: 'Exames e Laboratórios' },
                   { name: 'Vídeo Nasofibroscopia', subgroup: 'Exames e Laboratórios' },
                   { name: 'Vídeo Laringoscopia', subgroup: 'Exames e Laboratórios' },
                   { name: 'Vídeo Endoscopia', subgroup: 'Exames e Laboratórios' },
                   { name: 'Ultrassonografia ou Ecografia Ocular',
                     subgroup: 'Exames e Laboratórios' },
                   { name: 'Ultrassonografia Ocular', subgroup: 'Exames e Laboratórios' },
                   { name: 'Ultrassonografia Doppler', subgroup: 'Exames e Laboratórios' },
                   { name: 'Ultrassonografia Biomicroscópica', subgroup: 'Exames e Laboratórios' },
                   { name: 'Ultrassonografia', subgroup: 'Exames e Laboratórios' },
                   { name: 'Raio-X', subgroup: 'Exames e Laboratórios' },
                   { name: 'Treinamento Auditivo', subgroup: 'Exames e Laboratórios' },
                   { name: 'Toxicologia', subgroup: 'Exames e Laboratórios' },
                   { name: 'Audiometria Tonal', subgroup: 'Exames e Laboratórios' },
                   { name: 'Colonoscopia', subgroup: 'Exames e Laboratórios' },
                   { name: 'Densitometria Osséa', subgroup: 'Exames e Laboratórios' },
                   { name: 'Ecocardiografia com Stress Farmacológico',
                     subgroup: 'Exames e Laboratórios' },
                   { name: 'Ecocardiograma', subgroup: 'Exames e Laboratórios' },
                   { name: 'Ecografia Geral e 4D', subgroup: 'Exames e Laboratórios' },
                   { name: 'Ecografia ', subgroup: 'Exames e Laboratórios' },
                   { name: 'Espirometria', subgroup: 'Exames e Laboratórios' },
                   { name: 'Holter', subgroup: 'Exames e Laboratórios' },
                   { name: 'Impendanciometria', subgroup: 'Exames e Laboratórios' },
                   { name: 'Laringoscopia', subgroup: 'Exames e Laboratórios' },
                   { name: 'Mamografia', subgroup: 'Exames e Laboratórios' },
                   { name: 'Mapa', subgroup: 'Exames e Laboratórios' },
                   { name: 'Nasofibroscopia', subgroup: 'Exames e Laboratórios' },
                   { name: 'Prevenção', subgroup: 'Odontologia' },
                   { name: 'Radiologia Digital', subgroup: 'Exames e Laboratórios' },
                   { name: 'Odontopediatria', subgroup: 'Odontologia' },
                   { name: 'Dentística', subgroup: 'Odontologia' },
                   { name: 'Teste Ergométrico', subgroup: 'Exames e Laboratórios' },
                   { name: 'Endodontia', subgroup: 'Odontologia' },
                   { name: 'Periodontia', subgroup: 'Odontologia' },
                   { name: 'Prótese', subgroup: 'Odontologia' },
                   { name: 'Tomografia Computadorizada', subgroup: 'Exames e Laboratórios' },
                   { name: 'Cirurgião dentista', subgroup: 'Odontologia' },
                   { name: 'Ortodontia', subgroup: 'Odontologia' },
                   { name: 'Ecodopplercardiograma', subgroup: 'Exames e Laboratórios' },
                   { name: 'Radiologia Odontológica', subgroup: 'Odontologia' },
                   { name: 'Cirurgia Bucomaxilofacial', subgroup: 'Odontologia' },
                   { name: 'Implantes', subgroup: 'Odontologia' },
                   { name: 'Ultrassonografia', subgroup: 'Exames e Laboratórios' },
                   { name: 'Enxerto Ósseo', subgroup: 'Odontologia' },
                   { name: 'Clareamento Dentário', subgroup: 'Odontologia' },
                   { name: 'Doppler', subgroup: 'Exames e Laboratórios' },
                   { name: 'Traumatismo Bucofacial', subgroup: 'Odontologia' },
                   { name: 'Tratamento do Ronco e Apnéia ', subgroup: 'Odontologia' },
                   { name: 'Obstetricia Diagnostica', subgroup: 'Exames e Laboratórios' },
                   { name: 'Tratamento de Canal ', subgroup: 'Odontologia' },
                   { name: 'Densitometria', subgroup: 'Exames e Laboratórios' },
                   { name: 'Biópsias', subgroup: 'Exames e Laboratórios' },
                   { name: 'Bistrô', subgroup: 'Restaurantes' },
                   { name: 'Punções', subgroup: 'Exames e Laboratórios' },
                   { name: 'Brasserie', subgroup: 'Restaurantes' },
                   { name: 'Cantina', subgroup: 'Restaurantes' },
                   { name: 'Churrascaria', subgroup: 'Restaurantes' },
                   { name: 'Comida por quilo', subgroup: 'Restaurantes' },
                   { name: 'Food Truck', subgroup: 'Restaurantes' },
                   { name: 'Procedimento Percutâneo Terapêutico ',
                     subgroup: 'Exames e Laboratórios' },
                   { name: 'Lanchonete', subgroup: 'Restaurantes' },
                   { name: 'Pizzaria', subgroup: 'Restaurantes' },
                   { name: 'Fast Food', subgroup: 'Restaurantes' },
                   { name: 'Hamburgueria', subgroup: 'Restaurantes' },
                   { name: 'Tomografias e Angiotomografias ', subgroup: 'Exames e Laboratórios' },
                   { name: 'Tomossíntese (TMS)', subgroup: 'Exames e Laboratórios' },
                   { name: 'Ecografia Vascular com Doppler', subgroup: 'Exames e Laboratórios' },
                   { name: 'Audiometria Tonal', subgroup: 'Exames e Laboratórios' },
                   { name: 'Bioimpedanciometria', subgroup: 'Academia' },
                   { name: 'Retossigmoidoscopia', subgroup: 'Exames e Laboratórios' },
                   { name: 'Uro-Ressonância ', subgroup: 'Exames e Laboratórios' },
                   { name: 'Angioressonância', subgroup: 'Exames e Laboratórios' },
                   { name: 'Patologia Clínica', subgroup: 'Consulta Médica' },
                   { name: 'Medicina do Trabalho', subgroup: 'Consulta Médica' },
                   { name: 'Análises Clínicas', subgroup: 'Exames e Laboratórios' },
                   { name: 'Anatomia Patológica', subgroup: 'Exames e Laboratórios' },
                   { name: 'Citogenética', subgroup: 'Exames e Laboratórios' },
                   { name: 'Citologia', subgroup: 'Exames e Laboratórios' },
                   { name: 'Coleta Ginecológica', subgroup: 'Exames e Laboratórios' },
                   { name: 'Curva Glicemica', subgroup: 'Exames e Laboratórios' },
                   { name: 'Curvas', subgroup: 'Exames e Laboratórios' },
                   { name: 'Curvas Glicêmicas e Hormonais', subgroup: 'Exames e Laboratórios' },
                   { name: 'Drogas na Urina', subgroup: 'Exames e Laboratórios' },
                   { name: 'Espermograma', subgroup: 'Exames e Laboratórios' },
                   { name: 'Líquor', subgroup: 'Exames e Laboratórios' },
                   { name: 'Medicina Ocupacional', subgroup: 'Consulta Médica' },
                   { name: 'Mielograma', subgroup: 'Exames e Laboratórios' },
                   { name: 'Homeopatia', subgroup: 'Consulta Médica' },
                   { name: 'Provas Funcionais', subgroup: 'Exames e Laboratórios' },
                   { name: 'Sexagem Fetal', subgroup: 'Exames e Laboratórios' },
                   { name: 'Teste de Paternidade', subgroup: 'Exames e Laboratórios' },
                   { name: 'Teste do Pezinho', subgroup: 'Exames e Laboratórios' },
                   { name: 'Testes Funcionais', subgroup: 'Exames e Laboratórios' },
                   { name: 'Vacinas', subgroup: 'Exames e Laboratórios' },
                   { name: 'Artigos para Festa', subgroup: 'Comércio em Geral' },
                   { name: 'Eletrocardiograma', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Eletrocardiograma', subgroup: 'Exames e Laboratórios' },
                   { name: 'Ecocardiografia Transtorácica ', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Ecocardiografia Transtorácica ', subgroup: 'Exames e Laboratórios' },
                   { name: 'Endoscopia Digestiva Alta', subgroup: 'Clínicas e Hospitais' },
                   { name: 'Endoscopia Digestiva Alta', subgroup: 'Exames e Laboratórios' },
                   { name: 'Balanceamento', subgroup: 'Mecânica e serv. Automotivos' }]

    groups_hash.each do |group|
      Group.find_or_create_by(name: group[:name],
                              sub_group_id: SubGroup.find_by_name(group[:subgroup]).id) do |_w|
        puts 'Creating Group ' + group[:name] + '...'
      end
    end

    ###
  end

  desc 'FAKE DATA'
  task fake: :environment do
    puts 'Executando fake data'
    puts "CRIANDO EMPRESAS #{`rake db:fake_companies`}"
    puts "CRIANDO ASSOCIAÇÃO EMPRESA-CATEGORIA #{`rake db:fake_company_categories`}"
    puts "CRIANDO CLIENTES #{`rake db:fake_clients`}"
    puts "CRIANDO BENEFÍCIOS #{`rake db:fake_benefits`}"
    puts "CRIANDO AVALIAÇÕES #{`rake db:fake_ratings`}"
    puts "CRIANDO AVALIAÇÕES #{`rake db:fake_tags`}"
    puts "CRIANDO AVALIAÇÕES #{`rake db:fake_benefit_tags`}"
  end

  desc 'FAKE COMPANIES'
  task fake_companies: :environment do
    50.times do
      fake_company_user = User.create!(
        email: Faker::Internet.email,
        password: '123123',
        password_confirmation: '123123',
        approved: true
      )
      fake_company_user.add_role(:company)
      fake_company_user.create_company!(
        name: Faker::Company.name,
        about: Faker::Lorem.paragraphs(number: 3),
        website: Faker::Internet.url,
        zipcode: Faker::Address.zip,
        address: Faker::Address.street_name,
        cnpj: Faker::Company.brazilian_company_number(formatted: true),
        phone: Faker::PhoneNumber.phone_number,
        address_number: Faker::Address.secondary_address,
        address_complement: Faker::Address.building_number,
        address_neighbourhood: Faker::Address.community,
        city: Faker::Address.city,
        state: Faker::Address.state,
        company_type: Company.company_types.keys.sample
      )
    end
  end

  desc 'FAKE COMPANIES CATEGORIES'
  task fake_company_categories: :environment do
    50.times do
      CompanyCategory.create!(
        category_id: Category.all.sample.id,
        company_id: Company.all.sample.id
      )
    end
  end

  desc 'FAKE CLIENTS'
  task fake_clients: :environment do
    50.times do
      fake_client_user = User.create!(
        email: Faker::Internet.email,
        password: '123123',
        password_confirmation: '123123',
        approved: true
      )
      fake_client_user.add_role(:client)
      fake_client_user.create_client!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        cpf: Faker::Number.number(digits: 10),
        phone: Faker::PhoneNumber.phone_number,
        cellphone: Faker::PhoneNumber.phone_number,
        birthdate: Faker::Date.between(from: 2.days.ago, to: Date.today),
        zipcode: Faker::Address.zip,
        address: Faker::Address.street_name,
        address_number: Faker::Address.secondary_address,
        address_complement: Faker::Address.building_number,
        address_neighbourhood: Faker::Address.community,
        city: Faker::Address.city,
        state: Faker::Address.state
      )
    end
  end

  desc 'FAKE BENEFITS'
  task fake_benefits: :environment do
    50.times do
      Benefit.create!(
        info: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false),
        product_name: Faker::Food.dish,
        price: Faker::Number.decimal(l_digits: 2),
        discount: Faker::Number.decimal(l_digits: 2),
        initial_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
        final_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
        company_id: Company.all.sample.id
      )
    end
  end

  desc 'FAKE RATINGS'
  task fake_ratings: :environment do
    150.times do
      Rating.create!(
        client_id: Client.all.sample.id,
        company_id: Company.all.sample.id,
        value: [1, 2, 3, 4, 5].sample
      )
    end
  end

  desc 'FAKE TAGS'
  task fake_tags: :environment do
    100.times do
      Tag.create!(name: Faker::Beer.malts)
    end
  end

  desc 'FAKE BENEFIT-TAG'
  task fake_benefit_tags: :environment do
    150.times do
      BenefitTag.create!(
        benefit_id: Benefit.all.sample.id,
        tag_id: Tag.all.sample.id
      )
    end
  end
end
