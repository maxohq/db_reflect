defmodule SessionRepo do
  use MaxoAdapt, default: SessionRepo.Psql

  # Define the adapter behavior
  behaviour do
    @doc ~S"""
    Lookup a sessions based on token.
    """
    @callback get(token :: binary) :: {:ok, Session.t() | nil} | {:error, atom}
  end

  # Add module functions outside the behaviour definition
  # These can use the behaviour's callbacks like they exist as functions.
  @spec get!(binary) :: Session.t() | nil | no_return
  def get!(token) do
    case get(token) do
      {:ok, result} -> result
      {:error, reason} -> raise "SessionRepo: #{reason}"
    end
  end
end
