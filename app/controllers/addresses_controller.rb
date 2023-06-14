class AddressesController < ApplicationController


  def edit
# paramsのidは、patientのid
    @patient = Patient.find(params[:id])
    @address = Address.find_by(patient_id: params[:id])
  end

  def update
# paramsのidは、addressのid
    @address = Address.find(params[:id])
    @patient = Patient.find(@address.patient_id)
    if @address.update(address_params)
      redirect_to "/patients/#{@patient.id}"
    else
      render :edit
    end
  end


private

  def address_params
    params.require(:address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :phone_number2)
  end


end
