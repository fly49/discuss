defmodule Discuss.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Discuss.Accounts.Credential

  schema "users" do
    field :nickname, :string
    has_one :credential, Credential

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:nickname])
    |> validate_required([:nickname])
    |> unique_constraint(:nickname)
  end
end
