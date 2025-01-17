defmodule ExCoveralls.PathReader do
  @moduledoc """
  Provide methods for base path for displaying File paths of the modules.
  It uses Mix.project path as base folder.
  """

  @doc """
  Returns the Mix.Project base path.
  """
  def base_path do
    case Application.fetch_env(:excoveralls, :base_path) do
      {:ok, base_path} -> base_path
      :error -> Mix.Project.config_files() |> Enum.find(&(&1 =~ ~r/mix.exs/)) |> Path.dirname()
    end
  end

  @doc """
  Expand path relative to the Mix.Project base path.
  """
  def expand_path(path) do
    Path.expand(path, base_path())
  end
end
