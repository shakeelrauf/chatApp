defmodule Chatto.User do
  use Chatto.Web, :model

  schema "users" do
    field :name, :string
    field :username, :string,null: false
    field :password, :string
    field :hash_password, :string

    timestamps
  end

  @required_fields ~w(name username)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> validate_length(:username, min: 1, max: 20)
  end
end
