class ContactsController < ApplicationController

  def edit
    # paramsのidは、patientのid
        @patient = Patient.find(params[:id])
        @contact = Contact.find_by(patient_id: params[:id])
      end
    
      def update
    # paramsのidは、contactのid
        @contact = Contact.find(params[:id])
        @patient = Patient.find(@contact.patient_id)
        if @contact.update(contact_params)
          redirect_to "/patients/#{@patient.id}"
        else
          render :edit
        end
      end
    
    
    private
    
      def contact_params
        params.require(:contact).permit(:full_name1, :full_name_kana1, :relation1, :phone_number11, :phone_number12, :description1, :full_name2, :full_name_kana2, :relation2, :phone_number21, :phone_number22, :description2)
      end

end
