defmodule InventoryRoom.Contexts.RefundsAndReturns do
  alias StoreRepo.Repo
  alias InventoryRoom.Settings.RefundsAndReturns.{
    AdjustmentReason,
    Adjustment,
    CustomerReturn,
    RefundReason,
    Refund,
    ReimbursementType,
    Reimbursement,
    ReturnAuthorization,
    ReturnReason
  }

  # Create
  def create_adjustment_reason(params) do
    %AdjustmentReason{}
    |> AdjustmentReason.create_changeset(params)
    |> Repo.insert()
  end

  def create_adjustment(params) do
    %Adjustment{}
    |> Adjustment.create_changeset(params)
    |> Repo.insert()
  end

  def create_customer_return(params) do
    %CustomerReturn{}
    |> CustomerReturn.create_changeset(params)
    |> Repo.insert()
  end

  def create_refund_reason(params) do
    %RefundReason{}
    |> RefundReason.create_changeset(params)
    |> Repo.insert()
  end

  def create_refund(params) do
    %Refund{}
    |> Refund.create_changeset(params)
    |> Repo.insert()
  end

  def create_reimbursement_type(params) do
    %ReimbursementType{}
    |> ReimbursementType.create_changeset(params)
    |> Repo.insert()
  end

  def create_reimbursement(params) do
    %Reimbursement{}
    |> Reimbursement.create_changeset(params)
    |> Repo.insert()
  end

  def create_return_authorization(params) do
    %ReturnAuthorization{}
    |> ReturnAuthorization.create_changeset(params)
    |> Repo.insert()
  end

  def create_return_reason(params) do
    %ReturnReason{}
    |> ReturnReason.create_changeset(params)
    |> Repo.insert()
  end

  # Read
  def get_adjustment_reason(id), do: Repo.get(AdjustmentReason, id)

  def get_adjustment(id), do: Repo.get(Adjustment, id)

  def get_customer_return(id), do: Repo.get(CustomerReturn, id)

  def get_refund_reason(id), do: Repo.get(RefundReason, id)

  def get_refund(id), do: Repo.get(Refund, id)

  def get_reimbursement_type(id), do: Repo.get(ReimbursementType, id)

  def get_reimbursement(id), do: Repo.get(Reimbursement, id)

  def get_return_authorization(id), do: Repo.get(ReturnAuthorization, id)

  def get_return_reason(id), do: Repo.get(ReturnReason, id)

  # Update
  def update_adjustment_reason(%AdjustmentReason{} = schema, params) do
    schema
    |> AdjustmentReason.changeset(params)
    |> Repo.update()
  end

  def update_adjustment(%Adjustment{} = schema, params) do
    schema
    |> Adjustment.changeset(params)
    |> Repo.update()
  end

  def update_customer_return(%CustomerReturn{} = schema, params) do
    schema
    |> CustomerReturn.changeset(params)
    |> Repo.update()
  end

  def update_refund_reason(%RefundReason{} = schema, params) do
    schema
    |> RefundReason.changeset(params)
    |> Repo.update()
  end

  def update_refund(%Refund{} = schema, params) do
    schema
    |> Refund.changeset(params)
    |> Repo.update()
  end

  def update_reimbursement_type(%ReimbursementType{} = schema, params) do
    schema
    |> ReimbursementType.changeset(params)
    |> Repo.update()
  end

  def update_reimbursement(%Reimbursement{} = schema, params) do
    schema
    |> Reimbursement.changeset(params)
    |> Repo.update()
  end

  def update_return_authorization(%ReturnAuthorization{} = schema, params) do
    schema
    |> ReturnAuthorization.changeset(params)
    |> Repo.update()
  end

  def update_return_reason(%ReturnReason{} = schema, params) do
    schema
    |> ReturnReason.changeset(params)
    |> Repo.update()
  end

  # Delete
  def delete_adjustment_reason(%AdjustmentReason{} = schema) do
    AdjustmentReason.delete_changeset(schema)
    |> Repo.delete()
  end

  def delete_adjustment(%Adjustment{} = schema) do
    Adjustment.delete_changeset(schema)
    |> Repo.delete()
  end

  def delete_customer_return(%CustomerReturn{} = schema) do
    CustomerReturn.delete_changeset(schema)
    |> Repo.delete()
  end

  def delete_refund_reason(%RefundReason{} = schema) do
    RefundReason.delete_changeset(schema)
    |> Repo.delete()
  end

  def delete_refund(%Refund{} = schema) do
    Refund.delete_changeset(schema)
    |> Repo.delete()
  end

  def delete_reimbursement_type(%ReimbursementType{} = schema) do
    ReimbursementType.delete_changeset(schema)
    |> Repo.delete()
  end

  def delete_reimbursement(%Reimbursement{} = schema) do
    Reimbursement.delete_changeset(schema)
    |> Repo.delete()
  end

  def delete_return_authorization(%ReturnAuthorization{} = schema) do
    ReturnAuthorization.delete_changeset(schema)
    |> Repo.delete()
  end

  def delete_return_reason(%ReturnReason{} = schema) do
    ReturnReason.delete_changeset(schema)
    |> Repo.delete()
  end
end