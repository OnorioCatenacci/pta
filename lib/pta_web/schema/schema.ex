defmodule Pta.Web.Schema do
  use Absinthe.Schema
  alias Pta.Web.Resolvers.Performance
  import_types(Absinthe.Type.Custom)

  query do
    field :performances, list_of(:performance) do
      arg(:performance_date, :string)
      resolve(&Pta.Web.Resolvers.Performance.performances/3)
    end
  end

  @desc "A performance at a specific venue"
  object :performance do
    field :id, :id
    @desc "The name of the performance"
    field :name, :string
    @desc "The date of the performance"
    field :date, :date
    @desc "The name of the performer or performers"
    field :performer, :string
    @desc "The time of the start of the performance (Eastern Standard Time)"
    field :start_time, :time
    @desc "The name of the venue where the performance is to be held"
    field :venue, :string
  end

  @desc "A concert or performance venue"
  object :venue do
    field :id, :id
    @desc "The name of the venue"
    field :name, :string
    @desc "The state in which the venus is located"
    field :state, :string
    @desc "The zipcode in which the venue is located"
    field :zip, :string
    @desc "The street adddress of the venue"
    field :address, :string
    @desc "The city in which the venue is located"
    field :city, :string
  end
end
