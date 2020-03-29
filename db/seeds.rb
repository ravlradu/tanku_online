# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
c=Category.create name:"ALIMENTE DE BAZA"
  Category.create name:"ULEI, OTET", parent_id: c.id
  Category.create name:"ZAHAR", parent_id: c.id
  Category.create name:"FAINA, GRIS", parent_id: c.id
  Category.create name:"OREZ", parent_id: c.id
  Category.create name:"PASTE FAINOASE", parent_id:c.id
c=Category.create name:"LACTATE SI OUA"
  Category.create name:"LAPTE", parent_id:c.id
  Category.create name:"IAURT SI SMANTANA", parent_id:c.id
  Category.create name:"BRANZETURI", parent_id:c.id
  Category.create name:"UNT SI MARGARINA", parent_id:c.id
  Category.create name:"OUA", parent_id:c.id
c=Category.create name:"FRUCTE SI LEGUME PROASPETE"
  Category.create name:"FRUCTE ", parent_id:c.id
  Category.create name:"LEGUME", parent_id:c.id
c=Category.create name:"BRUTARIE – PATISERIE"
  Category.create name:"PAINE", parent_id:c.id
  Category.create name:"COFETARIE – PATISERIE", parent_id:c.id
c=Category.create name:"CARNE SI SEMIPREPARATE CARNE", parent_id:c.id
  Category.create name:"CARNE PROASPATA", parent_id:c.id
  Category.create name:"PRODUSE SEMIPREPARATE", parent_id:c.id
  Category.create name:"MEZELURI", parent_id:c.id
  Category.create name:"SALAM", parent_id:c.id
  Category.create name:"SUNCA", parent_id:c.id
  Category.create name:"CARNATI", parent_id:c.id
  Category.create name:"BACON", parent_id:c.id
  Category.create name:"CRENVURSTI", parent_id:c.id
  Category.create name:"PARIZER", parent_id:c.id
  Category.create name:"CONGELATE", parent_id:c.id
  Category.create name:"CARNE", parent_id:c.id
  Category.create name:"PESTE SI FRUCTE DE MARE", parent_id:c.id
c=Category.create name:"LEGUME SI FRUCTE"
c=Category.create name:"SEMIPREPARATE"
  Category.create name:"CONSERVE SI COMPOTURI", parent_id:c.id
  Category.create name:"CONSERVE CARNE SI PATE", parent_id:c.id
  Category.create name:"CONSERVE PESTE", parent_id:c.id
  Category.create name:"CONSERVE LEGUME SI FRUCTE", parent_id:c.id
  Category.create name:"CONSERVE MURATURI", parent_id:c.id
  Category.create name:"COMPOTURI", parent_id:c.id
  Category.create name:"SOSURI SI PASTE DE TOMATE", parent_id:c.id
  Category.create name:"PASTE DE TOMATE SI BULION", parent_id:c.id
  Category.create name:"SOSURI", parent_id:c.id
  Category.create name:"KETCHUP", parent_id:c.id
  Category.create name:"MAIONEZA", parent_id:c.id
  Category.create name:"MUSTAR SI HREAN", parent_id:c.id
c=Category.create name:"DULCIURI SI SNACKS"
  Category.create name:"CIOCOLATA", parent_id:c.id
  Category.create name:"NAPOLOTANE, BISCUITI", parent_id:c.id
  Category.create name:"DROPSURI, JELEURI", parent_id:c.id
  Category.create name:"POPCORN, COVRIGEI, PUFULETI", parent_id:c.id
  Category.create name:"SEMINTE, ALUNE, FRUCTE USCATE", parent_id:c.id
  Category.create name:"CHIPSURI", parent_id:c.id
c=Category.create name:"APA SI SUCURI"
  Category.create name:"APA", parent_id:c.id
  Category.create name:"SUCURI CARBOGAZOASE", parent_id:c.id
  Category.create name:"SUCURI NECARBOGAZOASE", parent_id:c.id
  Category.create name:"NECTARE", parent_id:c.id
  Category.create name:"SIROPURI", parent_id:c.id
c=Category.create name:"BAUTURI SI TUTUN"
  Category.create name:"VINURI", parent_id:c.id
  Category.create name:"BAUTURI ALCOOLICE", parent_id:c.id
  Category.create name:"BERE, CIDRU", parent_id:c.id
  Category.create name:"TIGARI", parent_id:c.id
c=Category.create name:"CONDIMENTE", parent_id:c.id
  Category.create name:"SARE", parent_id:c.id
  Category.create name:"CONDIMENTE", parent_id:c.id
c=Category.create name:"CAFEA, CEREALE, MIC DEJUN"
  Category.create name:"CAFEA NATURALA", parent_id:c.id
  Category.create name:"CAFEA INSTANT", parent_id:c.id
  Category.create name:"CEAI", parent_id:c.id
  Category.create name:"CACAO", parent_id:c.id
  Category.create name:"CEREALE", parent_id:c.id
  Category.create name:"DULCEATA, MIERE SI CRÈME TARTINABILE", parent_id:c.id
c=Category.create name:"COSMETICE SI INGRIJIRE PERSONALA"
  Category.create name:"SAMPON SI ALTE PRODUSE DE HAIR STYLING", parent_id:c.id
  Category.create name:"GEL DE DUS SI SAPUN", parent_id:c.id
  Category.create name:"DEODORANTE", parent_id:c.id
  Category.create name:"PASTE SI PERIUTE DE DINTI", parent_id:c.id
  Category.create name:"IGIENA INTIMA", parent_id:c.id
c=Category.create name:"CURATENIE SI NEALIMENTARE"
  Category.create name:"DETERGENTI VASE", parent_id:c.id
  Category.create name:"DETERGENTI CURATENIE", parent_id:c.id
  Category.create name:"DETERGENTI SI BALSAM RUFE", parent_id:c.id
  Category.create name:"ODORIZANTE", parent_id:c.id
  Category.create name:" HARTIE IGIENICA SI ROLE DE BUCATARIE", parent_id:c.id
