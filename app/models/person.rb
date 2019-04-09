class Person < ActiveRecord::Base
  has_many :addresses
  accepts_nested_attributes_for :addresses
  ## creates addresses_attributes= method for us which will create keys starting from zero and save each address in the value of each key

  def new
      @person = Person.new
      @person.addresses.build(address_type: 'work')
      @person.addresses.build(address_type: 'home')
  end

  def create
    person = Person.create(person_params)
    redirect_to people_path
  end

  def index
    @people = Person.all
  end

  private

  def person_params
    params.require(:person).permit(:name)
  end
end
