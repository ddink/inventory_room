defmodule InventoryRoom.API.RefundsAndReturns do
  alias InventoryRoom.Contexts.RefundsAndReturns, as: Returns

  ###########################
  # Refunds and Returns API #
  ###########################

  # Create
  def create_adjustment_reason(params), do: Returns.create_adjustment_reason(params)

  def create_adjustment(params), do: Returns.create_adjustment(params)

  def create_customer_return(params), do: Returns.create_customer_return(params)

  def create_refund_reason(params), do: Returns.create_refund_reason(params)

  def create_refund(params), do: Returns.create_refund(params)

  def create_reimbursement_type(params), do: Returns.create_reimbursement_type(params)

  def create_reimbursement(params), do: Returns.create_reimbursement(params)

  def create_return_authorization(params), do: Returns.create_return_authorization(params)

  def create_return_reason(params), do: Returns.create_return_reason(params)

  # Read
  def get_adjustment_reason(id), do: Returns.get_adjustment_reason(id)

  def get_adjustment(id), do: Returns.get_adjustment(id)

  def get_customer_return(id), do: Returns.get_customer_return(id)

  def get_refund_reason(id), do: Returns.get_refund_reason(id)

  def get_refund(id), do: Returns.get_refund(id)

  def get_reimbursement_type(id), do: Returns.get_reimbursement_type(id)

  def get_reimbursement(id), do: Returns.get_reimbursement(id)

  def get_return_authorization(id), do: Returns.get_return_authorization(id)

  def get_return_reason(id), do: Returns.get_return_reason(id)

  # Update
  def update_adjustment_reason(schema, params), do: Returns.update_adjustment_reason(schema, params)

  def update_adjustment(schema, params), do: Returns.update_adjustment(schema, params)

  def update_customer_return(schema, params), do: Returns.update_customer_return(schema, params)

  def update_refund_reason(schema, params), do: Returns.update_refund_reason(schema, params)

  def update_refund(schema, params), do: Returns.update_refund(schema, params)

  def update_reimbursement_type(schema, params), do: Returns.update_reimbursement_type(schema, params)

  def update_reimbursement(schema, params), do: Returns.update_reimbursement(schema, params)

  def update_return_authorization(schema, params), do: Returns.update_return_authorization(schema, params)

  def update_return_reason(schema, params), do: Returns.update_return_reason(schema, params)

  # Delete
  def delete_adjustment_reason(schema), do: Returns.delete_adjustment_reason(schema)

  def delete_adjustment(schema), do: Returns.delete_adjustment(schema)

  def delete_customer_return(schema), do: Returns.delete_customer_return(schema)

  def delete_refund_reason(schema), do: Returns.delete_refund_reason(schema)

  def delete_refund(schema), do: Returns.delete_refund(schema)

  def delete_reimbursement_type(schema), do: Returns.delete_reimbursement_type(schema)

  def delete_reimbursement(schema), do: Returns.delete_reimbursement(schema)

  def delete_return_authorization(schema), do: Returns.delete_return_authorization(schema)

  def delete_return_reason(schema), do: Returns.delete_return_reason(schema)
end