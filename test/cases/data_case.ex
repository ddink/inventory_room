defmodule InventoryRoom.DataCase do
	use ExUnit.CaseTemplate
	alias StoreRepo.Repo
	alias Ecto.Changeset

	alias InventoryRoom.Products.{
		OptionType
	}

	using do
		quote do
			import InventoryRoom.DataCase
			alias InventoryRoom.Factory
		end
	end

	def assert_valid_changeset(params, fields, changeset_fn) when is_list(fields) do
    changeset = changeset_fn.(params)

    assert %Changeset{valid?: true, changes: changes} = changeset

    params = atom_map(params)

    for field <- fields do
      actual = Map.get(changes, field)
      expected = params[field]

      assert actual == expected,
             "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
    end
  end

	def assert_invalid_changeset(params, fields, changeset_fn, validation_type)
      when is_list(fields) do
    # changeset = Cart.create_order_changeset(params)
    changeset = changeset_fn.(params)

    assert %Changeset{
             valid?: false,
             errors: errors
           } = changeset

    assert_error_fields(errors, fields, validation_type)
  end

	defp assert_error_fields(errors, fields, validation_type) when is_atom(validation_type) do
    for field <- fields do
      assert errors[field], "expected an error for #{field}"
      {_, meta} = errors[field]

      assert meta[:validation] == validation_type,
             "The validation type, #{meta[:validation]}, is incorrect."
    end
  end

	def option_type_fields, do: OptionType.fields()

	def bad_option_type_params do
		%{
			name: %{},
			presentation: 0,
			position: "not_an_integer"
		}
	end

	defp atom_map(string_key_map) do
    for {key, val} <- string_key_map, into: %{}, do: {String.to_atom(key), val}
  end

	setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(Repo, {:shared, self()})
    end

    :ok
  end
end