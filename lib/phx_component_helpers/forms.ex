defmodule PhxComponentHelpers.Forms do
  @moduledoc false

  @doc false
  def with_form_fields(assigns, fun, fallback \\ & &1) do
    form = assigns[:form]
    field = assigns[:field]

    if form && field do
      fun.(assigns, form, field)
    else
      fallback.(assigns)
    end
  end

  @doc false
  def form_errors(form, field) do
    Keyword.get_values(form.errors, field)
  end

  defp errors?(form, field) do
    errors = Keyword.get_values(form.errors, field)
    errors && !Enum.empty?(errors)
  end
end
