# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Default admin user
admin= User.create(:username => "admin", :email => "admin@gmail.com",:role => "administrator", :password => "123456", :password_confirmation => "123456")
company1 = Company.create(:name =>"CONECTIFLOR S.A",
                    :description => "",
                    :address => "Mariano Hurtado N50-34 y Vicente Heredia. Urbanización San Fernando. Quito, Ecuador Casilla 17-10-7013 Quito, Ecuador",
                    :peopleContact => "
                    Dean E Rule
                    Gerente General
                    drule@conectiflor.com
                    celular (+593) 98-545-7511
                    skype deanerule
                    
                    Marco Paredes
                    Business Representative - Research and Development
                    showroom@conectiflor.com
                    celular (+593) 99-426-4575
                    skype marco_paredes.1
                    msm pichupareb@hotmail.com
                    
                    Juan Carlos Vargas
                    Comercio Exterior - Logistica
                    locarga@conectiflor.com
                    celular (+593) 98-026-2068
                    
                    Sebastian Recalde
                    Hibridación e Investigación
                    breeding@conectiflor.com
                    celular (+593) 99-746-4664
                    
                    Francoise Mata
                    Financiera/Asistente Administrativa
                    connecfl@conectiflor.com
                    celular (+593) 98-025-2963
                    
                    María Fernanda Cisneros
                    Cobranzas y Contratos
                    datos@conectiflor.com
                    celular (+593) 98-538-3076",
                    :mission => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras quis tincidunt libero. Pellentesque maximus urna sed enim volutpat, id congue diam luctus. Donec sodales tincidunt justo. Praesent tincidunt urna accumsan, euismod quam et, consequat nulla. Integer aliquet diam ac neque tristique porttitor. Nulla rhoncus, dolor at efficitur rhoncus, mauris nunc dignissim ex, at feugiat lectus arcu non lectus. Suspendisse et dui ante. Sed facilisis vitae nisi ut mattis.",
                    :vision => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras quis tincidunt libero. Pellentesque maximus urna sed enim volutpat, id congue diam luctus. Donec sodales tincidunt justo. Praesent tincidunt urna accumsan, euismod quam et, consequat nulla. Integer aliquet diam ac neque tristique porttitor. Nulla rhoncus, dolor at efficitur rhoncus, mauris nunc dignissim ex, at feugiat lectus arcu non lectus. Suspendisse et dui ante. Sed facilisis vitae nisi ut mattis.",
                    :phone => "(+593) 2-2440867 / (+593) 2-2257420",
                    :cellPhone => "",
                    :email => "",
                    :facebookContact => "",
                    :skypeContact => "",
                    :webContact => "www.conectiflor.com")

company2 = Company.create(:name =>"Jan Spek Rozen B.V.",
                        :description => "",
                        :address => "Zijde 155
                        2771 EV Boskoop",
                        :peopleContact => "",
                        :mission => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras quis tincidunt libero. Pellentesque maximus urna sed enim volutpat, id congue diam luctus. Donec sodales tincidunt justo. Praesent tincidunt urna accumsan, euismod quam et, consequat nulla. Integer aliquet diam ac neque tristique porttitor. Nulla rhoncus, dolor at efficitur rhoncus, mauris nunc dignissim ex, at feugiat lectus arcu non lectus. Suspendisse et dui ante. Sed facilisis vitae nisi ut mattis.",
                        :vision => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras quis tincidunt libero. Pellentesque maximus urna sed enim volutpat, id congue diam luctus. Donec sodales tincidunt justo. Praesent tincidunt urna accumsan, euismod quam et, consequat nulla. Integer aliquet diam ac neque tristique porttitor. Nulla rhoncus, dolor at efficitur rhoncus, mauris nunc dignissim ex, at feugiat lectus arcu non lectus. Suspendisse et dui ante. Sed facilisis vitae nisi ut mattis.",
                        :phone => "",
                        :cellPhone => "0172-212120",
                        :email => "info@rozen.com",
                        :facebookContact => "www.facebook.com/JANSPEKROZEN",
                        :skypeContact => "",
                        :webContact => "")                    
company3 = Company.create(:name =>"International Rose Breeders",
                            :description => "International Rose Breeders LLC es un obtentor de variedades de rosa para el mundo y también representa  a Spek Rose Breeding en America. 
                            Haciendo el cruzamiento e hibridación en los Estados Unidos, y germinando las semillas en Colombia y próximamente en Ecuador, International Rose Breeders tiene representantes que evalúan, introducen y registran las licencias para sus variedades en los cinco continente  para producción y venta de rosas.",
                            :address => "",
                            :peopleContact => "",
                            :mission => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras quis tincidunt libero. Pellentesque maximus urna sed enim volutpat, id congue diam luctus. Donec sodales tincidunt justo. Praesent tincidunt urna accumsan, euismod quam et, consequat nulla. Integer aliquet diam ac neque tristique porttitor. Nulla rhoncus, dolor at efficitur rhoncus, mauris nunc dignissim ex, at feugiat lectus arcu non lectus. Suspendisse et dui ante. Sed facilisis vitae nisi ut mattis.",
                            :vision => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras quis tincidunt libero. Pellentesque maximus urna sed enim volutpat, id congue diam luctus. Donec sodales tincidunt justo. Praesent tincidunt urna accumsan, euismod quam et, consequat nulla. Integer aliquet diam ac neque tristique porttitor. Nulla rhoncus, dolor at efficitur rhoncus, mauris nunc dignissim ex, at feugiat lectus arcu non lectus. Suspendisse et dui ante. Sed facilisis vitae nisi ut mattis.",
                            :phone => "",
                            :cellPhone => "(+593)555 555 5555",
                            :email => "info@irb.com",
                            :facebookContact => "",
                            :skypeContact => "",
                            :webContact => "eghillcompany.com")                        