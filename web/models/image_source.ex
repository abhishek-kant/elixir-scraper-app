defmodule ScraperStore.ImageSource do
  use ScraperStore.Web, :model

  schema "image_sources" do
    field :url, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:url])
    |> validate_required([:url])
  end
end
